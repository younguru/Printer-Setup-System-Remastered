package org.PrinterSetupSystem.controller;

import org.PrinterSetupSystem.beans.Branch;
import org.PrinterSetupSystem.dao.HomeDao;
import org.PrinterSetupSystem.misc.AuthorizeUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/** Represents Home Controller
@author Akshin A. Mustafayev
@version 1.0
*/
public class HomeController extends HttpServlet 
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
//
//        autorization block delete!!!
//
        HttpSession session = request.getSession();
        session.setAttribute("login", "admin");
        session.setAttribute("session", "3f594f657804bf2942752cf5dc4e9921ecda7a3c68c509d46222da39bd3c2d5");
        session.setAttribute("fullname", "Kilil");

        AuthorizeUtil.SetUserCookie(response, "login", "admin", 24 * 60 * 60);
        AuthorizeUtil.SetUserCookie(response, "session", "3f594f657804bf2942752cf5dc4e9921ecda7a3c68c509d46222da39bd3c2d5", 24 * 60 * 60);
        AuthorizeUtil.SetUserCookie(response, "fullname", "Kilil", 24 * 60 * 60);
//
//        delete
//
    	AuthorizeUtil.FixUtf8(response);
    	AuthorizeUtil.SetAdminAuthorized(request, response);
    	
    	ArrayList<Branch> branches = HomeDao.GetBranches();
    	request.setAttribute("branches", branches);
    	
        RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp"); 
        rd.include(request, response);
    }
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	
        RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp"); 
        rd.include(request, response);
    }
}