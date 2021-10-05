package org.PrinterSetupSystem.controller;

import org.PrinterSetupSystem.beans.Script;
import org.PrinterSetupSystem.dao.AdminInstallScriptDao;
import org.PrinterSetupSystem.misc.AuthorizeUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminInstallScriptCreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorizeUtil.FixUtf8(response);
        AuthorizeUtil.SetAdminAuthorized(request, response);
        AuthorizeUtil.AuthorizedRedirect(request, response);

        Script script = new Script();
        request.setAttribute("script", script);
        RequestDispatcher rd = request.getRequestDispatcher("/AdminInstallScriptCreate.jsp");
        rd.include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorizeUtil.FixUtf8(response);
        AuthorizeUtil.SetAdminAuthorized(request, response);
        AuthorizeUtil.AuthorizedRedirect(request, response);

        if(request.getParameter("button_savescript") != null &&
                request.getParameter("adminscriptname") != null &&
                request.getParameter("adminscriptextension") != null &&
                request.getParameter("adminscript") != null)
        {
            String adminscriptname = request.getParameter("adminscriptname");
            String adminscriptextension = request.getParameter("adminscriptextension");
            String adminscript = request.getParameter("adminscript");

            Script script = new Script();
            script.setName(adminscriptname);
            script.setExtension(adminscriptextension);
            script.setValue(adminscript);

            Boolean result = AdminInstallScriptDao.CreateScript(script);
            if(result)
            {
                request.setAttribute("ScriptSaved", true);
                request.getRequestDispatcher("/admininstallscript").forward(request, response);
            }
            else
            {
                    request.setAttribute("script", script);
                    request.setAttribute("ErrorCreateScriptSave", true);
            }

            RequestDispatcher rd = request.getRequestDispatcher("/AdminInstallScriptCreate.jsp");
            rd.include(request, response);
        }
        else
        {
            request.setAttribute("ErrorScriptNotNumber", true);
            request.getRequestDispatcher("/admininstallscript").forward(request, response);
        }

    }
}
