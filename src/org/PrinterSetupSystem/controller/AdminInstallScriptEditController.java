package org.PrinterSetupSystem.controller;

import org.PrinterSetupSystem.beans.Script;
import org.PrinterSetupSystem.dao.AdminInstallScriptDao;
import org.PrinterSetupSystem.misc.AuthorizeUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminInstallScriptEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorizeUtil.FixUtf8(response);
        AuthorizeUtil.SetAdminAuthorized(request, response);
        AuthorizeUtil.AuthorizedRedirect(request, response);

        if(request.getParameter("scriptid") != null &&
                request.getParameter("scriptid") != "")
        {
            Integer scriptid = 0;
            try
            {
                scriptid = Integer.parseInt(request.getParameter("scriptid"));
            }
            catch (NumberFormatException e)
            {
                request.setAttribute("ErrorScriptNotNumber", true);
                request.getRequestDispatcher("/admininstallscript").forward(request, response);
            }

            Script script = AdminInstallScriptDao.GetInstallScript(scriptid);
            if(script != null)
            {
                request.setAttribute("script", script);

                RequestDispatcher rd = request.getRequestDispatcher("/AdminInstallScriptEdit.jsp");
                rd.include(request, response);
            }
            else
            {
                request.setAttribute("ErrorScriptNotFound", true);
                request.getRequestDispatcher("/admininstallscript").forward(request, response);
            }
        }
        else
        {
            request.setAttribute("ErrorScriptNotNumber", true);
            request.getRequestDispatcher("/admininstallscript").forward(request, response);
        }
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
            Integer editscriptid = Integer.parseInt(request.getParameter("editscriptid"));
            String adminscriptname = request.getParameter("adminscriptname");
            String adminscriptextension = request.getParameter("adminscriptextension");
            String adminscript = request.getParameter("adminscript");

            Script script = new Script();
            script.setId(editscriptid);
            script.setName(adminscriptname);
            script.setExtension(adminscriptextension);
            script.setValue(adminscript);

            Boolean result = AdminInstallScriptDao.SaveScript(script);
            if(result)
            {
                request.setAttribute("ScriptSaved", true);
                request.getRequestDispatcher("/admininstallscript").forward(request, response);
            }
            else
            {
                Script _script = AdminInstallScriptDao.GetInstallScript(editscriptid);
                if(_script != null)
                {
                    request.setAttribute("script", _script);
                    request.setAttribute("ErrorEditScriptSave", true);
                }
                else
                {
                    request.setAttribute("ErrorScriptNotFound", true);
                    request.getRequestDispatcher("/admininstallscript").forward(request, response);
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/AdminInstallScriptEdit.jsp");
            rd.include(request, response);
        }
        else
        {
            request.setAttribute("ErrorScriptNotNumber", true);
            request.getRequestDispatcher("/admininstallscript").forward(request, response);
        }
    }
}
