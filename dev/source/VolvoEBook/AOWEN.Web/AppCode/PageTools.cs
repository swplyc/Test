using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using AOWEN.Web.MDSMS;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Timers;
using System.Web.Mvc;
using AOWEN.BLL;
using AOWEN.Common;
using AOWEN.Model;
using WeDo.Log;
using WeDo.Log.Model;

namespace AOWEN.Web.AppCode
{
    public class PageTools
    {
        /// <summary>
        /// cookie中用户唯一性标识
        /// </summary>
        public static string CookieUniqueUser
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["unique_user_id"] != null)
                {
                    return HttpContext.Current.Request.Cookies["unique_user_id"].Value;
                }
                else
                {
                    return "";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("unique_user_id");
                hc.Value = value;
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// cookie中用户手机号
        /// </summary>
        public static string CookieMobile
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["cookie_mobile"] != null)
                {
                    return HttpContext.Current.Request.Cookies["cookie_mobile"].Value;
                }
                else
                {
                    return "";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("cookie_mobile");
                hc.Value = value;
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// cookie中来源标识
        /// </summary>
        public static string CookieSourceId
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["source_id"] != null)
                {
                    return HttpContext.Current.Request.Cookies["source_id"].Value;
                }
                else
                {
                    return "0";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("source_id");
                hc.Value = value;
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// cookie中用户投票Id
        /// </summary>
        public static string CookieVoteId
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["cookie_voteid"] != null)
                {
                    return HttpContext.Current.Request.Cookies["cookie_voteid"].Value;
                }
                else
                {
                    return "";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("cookie_voteid");
                hc.Value = value;
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// cookie中用户参赛作品Id
        /// </summary>
        public static string CookieWorkId
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["cookie_work_id"] != null)
                {
                    return HttpContext.Current.Request.Cookies["cookie_work_id"].Value;
                }
                else
                {
                    return "";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("cookie_work_id");
                hc.Value = value;
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// cookie中已上传图片用户参赛作品Id
        /// </summary>
        public static string CookieImageId
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["cookie_image_id"] != null)
                {
                    return HttpContext.Current.Request.Cookies["cookie_image_id"].Value;
                }
                else
                {
                    return "";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("cookie_image_id");
                hc.Value = value;
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// 保存活动的抽奖信息
        /// </summary>
        /// <param name="campaignId">活动Id</param>
        /// <param name="value">抽奖用户信息Id</param>
        public static void SetCookieLottery(int campaignId, string value)
        {
            HttpCookie hc = new HttpCookie("cookie_lottery_" + campaignId);
            hc.Value = value;
            hc.Expires = DateTime.Now.AddYears(1);
            HttpContext.Current.Response.Cookies.Add(hc);
        }

        /// <summary>
        /// 获取活动的抽奖信息
        /// </summary>
        /// <param name="campaignId"></param>
        /// <returns></returns>
        public static string GetCookieLottery(int campaignId)
        {
            var httpCookie = HttpContext.Current.Request.Cookies["cookie_lottery_" + campaignId];
            if (httpCookie != null)
                return httpCookie.Value;
            else
            {
                return "";
            }
        }

        /// <summary>
        /// cookie中购物车
        /// </summary>
        public static string CookieCart
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["cookie_cartmodel"] != null)
                {
                    return HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies["cookie_cartmodel"].Value);
                }
                else
                {
                    return "";
                }
            }

            set
            {
                HttpCookie hc = new HttpCookie("cookie_cartmodel");
                hc.Value = HttpUtility.UrlEncode(value);
                hc.Expires = DateTime.Now.AddYears(1);
                HttpContext.Current.Response.Cookies.Add(hc);
            }
        }

        /// <summary>
        /// 虚拟路径转化为带http的访问路径
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string GetHttpUrl(string url)
        {
            string reStr = "";
            if (url.Contains("://"))
            {
                return url;
            }
            try
            {
                reStr = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority +
                        VirtualPathUtility.ToAbsolute(url);
            }
            catch
            {
                reStr = "";
            }
            return reStr;
        }

        #region 判断是否为手机

        /// <summary>  
        /// 正则手机号  
        /// </summary>  
        private static readonly Regex RegexMobile =
            new Regex(
                @"(iemobile|iphone|ipod|android|nokia|sonyericsson|blackberry|samsung|sec\-|windows ce|motorola|mot\-|up.b|midp\-)",
                RegexOptions.IgnoreCase | RegexOptions.Compiled);

        /// <summary>  
        /// 是否为手机客户端  
        /// </summary>  
        public static bool IsMobile
        {
            get
            {
                HttpContext context = System.Web.HttpContext.Current;
                if (context != null)
                {
                    HttpRequest request = context.Request;
                    if (request.Browser.IsMobileDevice)
                    {
                        return true;
                    }

                    if (!string.IsNullOrEmpty(request.UserAgent) && RegexMobile.IsMatch(request.UserAgent))
                    {
                        return true;
                    }
                }


                return false;
            }
        }

        #endregion

        #region 生成短连接

        public static string GetShortUrl(string url)
        {
            WebClient wc = new WebClient();

            wc.QueryString.Set("url_long", url);
            wc.QueryString.Set("source", "1681459862");

            string urlPost = "http://api.t.sina.com.cn/short_url/shorten.json";
            var stream = wc.OpenRead(urlPost);
            if (stream == null)
            {
                return null;
            }
            StreamReader sr = new StreamReader(stream);

            string jsonstr = sr.ReadToEnd();
            sr.Close();
            if (jsonstr.Contains("\"error_code\""))
            {
                LogRunMan.AddLog("短连接生成", EnumListLog.LogLevel.ERROR, DateTime.Now, jsonstr);
                return null;
            }
            string result = Regex.Match(jsonstr, "(?<=\"url_short\":\").*?(?=\",)").Value;

            return result;
        }

        #endregion

        #region 加密连接字符串

        /// <summary>
        /// 加密/解密 连接字符串
        /// </summary>
        /// <param name="encrypt">true为加密，false为解密</param>
        public static void EncryptConnectionString(bool encrypt)
        {
            Configuration configFile = null;
            try
            {
                // Open the configuration file and retrieve the connectionStrings section.
                configFile = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                ConnectionStringsSection configSection =
                    configFile.GetSection("connectionStrings") as ConnectionStringsSection;
                if ((!(configSection.ElementInformation.IsLocked)) && (!(configSection.SectionInformation.IsLocked)))
                {
                    if (encrypt && !configSection.SectionInformation.IsProtected)
                        //encrypt is false to unencrypt
                    {
                        configSection.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
                    }
                    if (!encrypt && configSection.SectionInformation.IsProtected)
                        //encrypt is true so encrypt
                    {
                        configSection.SectionInformation.UnprotectSection();
                    }
                    //re-save the configuration file section
                    configSection.SectionInformation.ForceSave = true;
                    // Save the current configuration.
                    configFile.Save();
                }
            }
            catch (System.Exception ex)
            {
                LogExceptionMan.AddLog("加密ConnectionString", EnumListLog.LogLevel.ERROR, ex);
            }
        }

        #endregion
    }
}