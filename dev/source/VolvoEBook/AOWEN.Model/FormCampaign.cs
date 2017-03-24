/**
* FormCampaign.cs
*
* 功 能： N/A
* 类 名： FormCampaign
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
	//FormCampaign
    [Serializable]
    [Table("FormCampaign")]
	public class FormCampaign
	{
		#region Model
		private int _id;  
		private int _formid = 0;  
		private int _campaignid = 0;  
		private int _createid = 0;  
		private DateTime _createtime = DateTime.Now;  
		private int _datastate = 1;  
		private string _hint = "";  
		private string _redirecturl = "";  
		
		/// <summary>
		/// Id
		/// </summary>		
		       
        public int Id
        {
            get{ return _id; }
            set{ _id = value; }
        }    
        
		/// <summary>
		/// 模板编号
		/// </summary>		
		       
        public int FormId
        {
            get{ return _formid; }
            set{ _formid = value; }
        }    
        
		/// <summary>
		/// 活动编号
		/// </summary>		
		       
        public int CampaignId
        {
            get{ return _campaignid; }
            set{ _campaignid = value; }
        }    
        
		/// <summary>
		/// 创建者
		/// </summary>		
		       
        public int CreateId
        {
            get{ return _createid; }
            set{ _createid = value; }
        }    
        
		/// <summary>
		/// 创建时间
		/// </summary>		
		       
        public DateTime CreateTime
        {
            get{ return _createtime; }
            set{ _createtime = value; }
        }    
        
		/// <summary>
		/// 数据状态
		/// </summary>		
		       
        public int DataState
        {
            get{ return _datastate; }
            set{ _datastate = value; }
        }    
        
		/// <summary>
		/// 提示信息
		/// </summary>		
		       
        public string Hint
        {
            get{ return _hint; }
            set{ _hint = value; }
        }    
        
		/// <summary>
		/// 跳转URL
		/// </summary>		
		       
        public string RedirectUrl
        {
            get{ return _redirecturl; }
            set{ _redirecturl = value; }
        }    
        
		#endregion

        [ForeignKey("CampaignId")]
        public virtual CampaignInfo CampaignInfo { get; set; }
        [ForeignKey("FormId")]
        public virtual FormInfo FormInfo { get; set; }

	}
}