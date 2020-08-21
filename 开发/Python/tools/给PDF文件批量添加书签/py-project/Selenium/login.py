# coding:utf-8
# ��webdriver��¼����ȡcookies������requests���������Զ���Ϊ��
from selenium import webdriver
import requests
import time
import json
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

def main():
    # �������в�����ȡ��¼�û���������
    user_name = sys.argv[1]
    password = sys.argv[2]

    # �����¼ҳ��URL
    login_url = 'https://www.douban.com/accounts/login'

    # ��ȡchrome������
    opt = webdriver.ChromeOptions()
    # �����е�ʱ�򲻵������������
    # opt.set_headless()

    # ��ȡdriver����
    driver = webdriver.Chrome(chrome_options = opt)
    # �򿪵�¼ҳ��
    driver.get(login_url)

    print 'opened login page...'
    
    # ������������û��������룬�������¼��ť
    driver.find_element_by_name('form_email').send_keys(user_name)
    driver.find_element_by_name('form_password').send_keys(password)
    # ��ε�¼��Ҫ������֤�룬�����һ���ֹ�������֤���ʱ��
    time.sleep(6)
    driver.find_element_by_class_name('btn-submit').submit()
    print 'submited...'
    # �ȴ�2����
    time.sleep(2)

    # ����һ��requests session����
    s = requests.Session()
    # ��driver�л�ȡcookie�б���һ���б��б��ÿ��Ԫ�ض���һ���ֵ䣩
    cookies = driver.get_cookies()
    # ��cookies���õ�session��
    for cookie in cookies:
        s.cookies.set(cookie['name'],cookie['value'])

    # �ر�driver
    driver.close()
        
    # ��Ҫ��¼���ܿ�����ҳ��URL
    page_url = 'https://www.douban.com/accounts/'
    # ��ȡ��ҳ���HTML
    resp = s.get(page_url)
    resp.encoding = 'utf-8'
    print 'status_code = {0}'.format(resp.status_code)
    # ����ҳ���ݴ����ļ�
    with open('html.txt','w+') as  fout:
        fout.write(resp.text)
    
    print 'end'

if __name__ == '__main__':
    main()
