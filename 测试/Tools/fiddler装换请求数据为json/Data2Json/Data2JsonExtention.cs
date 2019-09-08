﻿using Fiddler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Data2Json
{

    public class Data2JsonExtention : Inspector2, IRequestInspector2
    {

        private bool _readOnly;
        HTTPRequestHeaders _headers;
        private byte[] _body;
        Data2JsonRequestControl _displayControl;

        #region Inspector2 implementation
        public override void AddToTab(TabPage o)
        {
            _displayControl = new Data2JsonRequestControl();
            o.Text = "Parameter2Json";
            o.Controls.Add(_displayControl);
            o.Controls[0].Dock = DockStyle.Fill;
        }

        public override int GetOrder()
        {
            return 0;
        }
        #endregion


        #region IRequestInspector2 implementation

        public HTTPRequestHeaders headers
        {
            get
            {
                return _headers;
            }
            set
            {
                _headers = value;
                System.Collections.Generic.Dictionary<string, string> httpHeaders = new System.Collections.Generic.Dictionary<string, string>();
                foreach (var item in headers)
                {
                    httpHeaders.Add(item.Name, item.Value);
                }
                httpHeaders.Add("requestUrl",headers.UriScheme + "://" + value["Host"] + headers.RequestPath);
                _displayControl.Headers = httpHeaders;
            }
        }


        public void Clear()
        {
            _displayControl.Clear();
        }

        public bool bDirty
        {
            get { return false; }
        }

        public bool bReadOnly
        {
            get
            {
                return _readOnly;
            }
            set
            {
                _readOnly = value;
            }
        }

        public byte[] body
        {
            get
            {
                return _body;
            }
            set
            {
                _body = value;
                _displayControl.Body = body;
            }
        }


        #endregion

    }
}
