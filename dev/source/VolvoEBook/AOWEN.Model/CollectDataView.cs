/**
* collect_data_view.cs
*
* 功 能： N/A
* 类 名： collect_data_view
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2015/11/13 15:34:00   N/A    初版
*
* Copyright (c) 2015 WEDO Corporation. All rights reserved.
*┌──────────────────────────────────┐
*│　此技术信息为本公司机密信息，未经本公司书面同意禁止向第三方披露．　│
*│　版权所有：上海唯都企业管理咨询有限公司　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/

using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace AOWEN.Model
{
	//collect_data_view
    [Serializable]
	public class collect_data_view
	{
		#region Model
		private int _orchard_id;  
		private string _data_id;  
		private DateTime _time;  
		private int _sensor_id;  
		private decimal _data;  
		private string _cname;  
		private string _unit;  
		private string _resolution;  
		private string _scope;  
		
		/// <summary>
		/// orchard_id
		/// </summary>		
		       
        public int orchard_id
        {
            get{ return _orchard_id; }
            set{ _orchard_id = value; }
        }    
        
		/// <summary>
		/// data_id
		/// </summary>		
		       
        public string data_id
        {
            get{ return _data_id; }
            set{ _data_id = value; }
        }    
        
		/// <summary>
		/// time
		/// </summary>		
		       
        public DateTime time
        {
            get{ return _time; }
            set{ _time = value; }
        }    
        
		/// <summary>
		/// sensor_id
		/// </summary>		
		       
        public int sensor_id
        {
            get{ return _sensor_id; }
            set{ _sensor_id = value; }
        }    
        
		/// <summary>
		/// data
		/// </summary>		
		       
        public decimal data
        {
            get{ return _data; }
            set{ _data = value; }
        }    
        
		/// <summary>
		/// cname
		/// </summary>		
		       
        public string cname
        {
            get{ return _cname; }
            set{ _cname = value; }
        }    
        
		/// <summary>
		/// unit
		/// </summary>		
		       
        public string unit
        {
            get{ return _unit; }
            set{ _unit = value; }
        }    
        
		/// <summary>
		/// resolution
		/// </summary>		
		       
        public string resolution
        {
            get{ return _resolution; }
            set{ _resolution = value; }
        }    
        
		/// <summary>
		/// scope
		/// </summary>		
		       
        public string scope
        {
            get{ return _scope; }
            set{ _scope = value; }
        }    
        
		#endregion
	}
}