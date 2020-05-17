package org.PrinterSetupSystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.PrinterSetupSystem.beans.Branch;
import org.PrinterSetupSystem.conn.ConnectionUtils;

public class HomeDao 
{
	/**
	Function returns all branches in ArrayList type.
	@return Returns ArrayList<Branch> array
	*/
	public static ArrayList<Branch> GetBranches()
    {
		ArrayList<Branch> branches = new ArrayList<Branch>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("select * from branches");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
            	if(rs.getInt("id") == 1) continue;
            	
            	Branch branch = new Branch();
            	branch.SetId(rs.getInt("id"));
            	branch.SetName(rs.getString("name"));
            	branch.SetDescription(rs.getString("description"));
            	if(rs.getString("image") != "")
            		branch.SetImage("uploads/" + rs.getString("image"));
            	else
            		branch.SetImage("img/no-image.png");
            	branch.SetCreatedDate(rs.getString("createddate"));
            	branches.add(branch);
            }
            
            pstmt.close();
            conn.close();
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return branches;
    }
}
