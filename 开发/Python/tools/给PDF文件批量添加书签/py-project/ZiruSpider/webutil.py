# coding:utf-8
# ͨ�õ���ҳ��ȡ������������
from constants import user_agents
import random
import requests
from requests import session

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

_session = session()

def get_html(url):
    '''
    ��ȡ��ҳHTML�ı�����
    '''
    headers = get_headers()
    resp = _session.get(url,headers = headers,timeout = 30)
    resp.encoding = 'utf-8'
    return resp.text

def get_headers():
    '''
    ��ȡ����ͷ
    '''
    headers = {'User-Agent':random.choice(user_agents)}
    return headers

def sample():
    url = 'http://sz.ziroom.com/z/nl/z1-d23008679-u1-x6.html'
    html = get_html(url)
    with open('page.txt','w+') as fout:
        fout.write(html)

if __name__ == '__main__':
    sample()
