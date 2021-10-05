package org.PrinterSetupSystem.dao;

import org.PrinterSetupSystem.beans.Script;
import org.PrinterSetupSystem.conn.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/** Represents Admin Administrator Install Script Page DAO
@author Akshin A. Mustafayev
@version 1.0
*/
public class AdminInstallScriptDao 
{
	public static ArrayList<Script> GetInstallScripts()
    {
		ArrayList<Script> scripts = new ArrayList<>();

		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("select * from installscripts");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next())
            {
                Script script = new Script();
            	script.setId(rs.getInt("id"));
                script.setName(rs.getString("name"));
                script.setExtension(rs.getString("extension"));
                script.setValue(rs.getString("value"));
                scripts.add(script);
            }

            rs.close();
            pstmt.close();
            conn.close();
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }

		return scripts;
    }

    public static Script GetInstallScript(Integer scriptid)
    {
        Script script = null;

        try
        {
            Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;

            pstmt = conn.prepareStatement("select * from installscripts where id=?");
            pstmt.setInt(1, scriptid);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                script = new Script();
                script.setId(rs.getInt("id"));
                script.setName(rs.getString("name"));
                script.setExtension(rs.getString("extension"));
                script.setValue(rs.getString("value"));
            }

            rs.close();
            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            script = null;
            e.printStackTrace();
        }

        return script;
    }

    /**
	Function updates Install Script in database.
	@param installscript Script text
	@return Returns true if successful
	*/
    public static Boolean SaveScript(Script script)
    {
        Boolean result = true;

        try
        {
            Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;

            pstmt = conn.prepareStatement("update installscripts set name = ?, extension = ?, value = ? where id=?");
            pstmt.setString(1, script.getName());
            pstmt.setString(2, script.getExtension());
            pstmt.setString(3, script.getValue());
            pstmt.setInt(4, script.getId());

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            result = false;
            e.printStackTrace();
        }

        return result;
    }
	
	/**
	Function gets Install Script Extension.
	@return Returns Script Extension string
	*/

    public static Boolean DeleteScript(Integer scriptid)
    {
        Boolean result = true;

        try
        {
            Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;

            pstmt = conn.prepareStatement("delete from installscripts where id=?");
            pstmt.setInt(1, scriptid);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            result = false;
            e.printStackTrace();
        }

        return result;
    }

    public static Boolean CreateScript(Script script)
    {
        Boolean result = true;

        try
        {
            Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            pstmt = conn.prepareStatement("insert into installscripts (name, extension, value) values (?, ?, ?)");

            pstmt.setString(1, script.getName());
            pstmt.setString(2, script.getExtension());
            pstmt.setString(3, script.getValue());
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            result = false;
            e.printStackTrace();
        }

        return result;
    }

}
