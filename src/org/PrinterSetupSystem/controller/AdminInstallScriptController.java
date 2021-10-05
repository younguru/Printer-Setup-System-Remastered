package org.PrinterSetupSystem.controller;

import org.PrinterSetupSystem.beans.Script;
import org.PrinterSetupSystem.dao.AdminInstallScriptDao;
import org.PrinterSetupSystem.misc.AuthorizeUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/** Represents Admin Install Script Controller
@author Akshin A. Mustafayev
@version 1.0
*/
public class AdminInstallScriptController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init(ServletConfig config) throws ServletException 
	{
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	AuthorizeUtil.SetAdminAuthorized(request, response);
    	AuthorizeUtil.AuthorizedRedirect(request, response);
    	
		ArrayList<Script> scripts = AdminInstallScriptDao.GetInstallScripts();
		request.setAttribute("scripts", scripts);

        RequestDispatcher rd = request.getRequestDispatcher("/AdminInstallScript.jsp"); 
        rd.include(request, response);
    }
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	AuthorizeUtil.SetAdminAuthorized(request, response);
    	AuthorizeUtil.AuthorizedRedirect(request, response);
    	
//    	if(request.getParameter("savescript_button") != null && request.getParameter("adminscript") != null
//    			 && request.getParameter("adminscriptextension") != null)
//        {
//    		String installscript = request.getParameter("adminscript");
//    		String scriptextension = request.getParameter("adminscriptextension");
//
//    		Boolean result = AdminInstallScriptDao.SetInstallScript(installscript);
//    		if(result)
//    		{
//    			request.setAttribute("InstallScriptSaved", true);
//    		}
//    		else
//    		{
//    			request.setAttribute("InstallScriptSaveError", true);
//    		}
//
//    		Boolean result2 = AdminInstallScriptDao.SetScriptExtension(scriptextension);
//    		if(result2)
//    		{
//    			request.setAttribute("ScriptExtensionSaved", true);
//    		}
//    		else
//    		{
//    			request.setAttribute("ScriptExtensionSaveError", true);
//    		}
//        }

		if(request.getParameter("button_deletescript") != null && request.getParameter("deletescriptid") != null)
		{
			Integer scriptid = 0;
			try
			{
				scriptid = Integer.parseInt(request.getParameter("deletescriptid"));
			}
			catch (NumberFormatException e)
			{
				request.setAttribute("ErrorScriptIDNotNumber", true);
			}

			Boolean result = AdminInstallScriptDao.DeleteScript(scriptid);
			if(result)
			{
				request.setAttribute("ScriptDeleted", true);
			}
			else
			{
				request.setAttribute("ErrorScriptDelete", true);
			}
		}

		ArrayList<Script> scripts = AdminInstallScriptDao.GetInstallScripts();
		request.setAttribute("scripts", scripts);

		RequestDispatcher rd = request.getRequestDispatcher("/AdminInstallScript.jsp");
		rd.include(request, response);
    }
}