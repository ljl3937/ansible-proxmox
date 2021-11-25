#coding=utf-8
import logging
import telnetlib
import time


class TelnetClient():
    def __init__(self,):
        self.tn = telnetlib.Telnet()

    # login
    def login_host(self,host_ip,username,password,port):
        try:
            # self.tn = telnetlib.Telnet(host_ip,port=23)
            self.tn.open(host_ip,port=port)
        except:
            logging.warning('%snetwork connection failed'%host_ip)
            return False
        # wait for username in 10s
        self.tn.read_until(b'vThunder login: ',timeout=10)
        self.tn.write(username.encode('ascii') + b'\n')
        # wait for pssword in 10s
        self.tn.read_until(b'Password: ',timeout=10)
        self.tn.write(password.encode('ascii') + b'\n')
        time.sleep(2)
        # read_very_eager() is get the result
        command_result = self.tn.read_very_eager().decode('ascii')
        if 'Login incorrect' not in command_result:
            logging.warning('%slogin  success'%host_ip)
            return True
        else:
            logging.warning('%slogin failed,password is invalid'%host_ip)
            return False

    def enable(self):
        self.tn.read_until(b'vThunder(NOLICENSE)>',timeout=10)
        self.tn.write("en".encode('ascii')+b'\n')
        time.sleep(2)
        command_result = self.tn.read_very_eager().decode('ascii')
        self.tn.read_until(b'Password:',timeout=10)
        self.tn.write('\n'.encode('ascii') + b'\n')
        time.sleep(2)
        command_result = self.tn.read_very_eager().decode('ascii')
        logging.warning('result:\n%s' % command_result)
        self.tn.write('configure terminal'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.read_until(b'vThunder(config)',timeout=30)
        return True

    def set_manage_network(self,ip):
        self.tn.write('interface management'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.read_until(b'vThunder(config-if:management)',timeout=10)
        time.sleep(2)
        self.tn.write(('ip address %s 255.255.255.0' % ip).encode('ascii') + b'\n')
        time.sleep(2)
        return True

    # run some commands
    def set_data_network(self,ip):
        self.tn.write('vlan 10'.encode('ascii') + b'\n')
        time.sleep(2)
        command_result = self.tn.read_very_eager().decode('ascii')
        self.tn.read_until(b'vThunder(config-vlan:10)',timeout=10)
        self.tn.write('tagged ethernet 1'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.write('router-interface ve 10'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.write('interface ethernet 1'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.write('enable'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.write('interface ve 10'.encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.write(('ip address %s 255.255.255.0' % ip).encode('ascii') + b'\n')
        time.sleep(2)
        self.tn.write('show run'.encode('ascii') + b'\n')
        time.sleep(2)
        command_result = self.tn.read_very_eager().decode('ascii')
        print(command_result)


    # logout telnet
    def logout_host(self):
        self.tn.write(b"exit\n")

if __name__ == '__main__':
    host_ip = '10.12.1.105'
    username = 'admin'
    password = 'a10'
    command = 'en'
    telnet_client = TelnetClient()
    if telnet_client.login_host(host_ip,username,password):
        telnet_client.enable()
        # telnet_client.set_manage_network(ip)
        # telnet_client.set_data_network(ip)