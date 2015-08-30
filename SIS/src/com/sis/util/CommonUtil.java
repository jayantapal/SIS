package com.sis.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class CommonUtil {
	public static Properties getProperties(){
		Properties prop = new Properties();
		String propFileName = "sis.properties";
 
		try{
			InputStream inputStream = new FileInputStream(propFileName);
			{
				prop.load(inputStream);
			}	
		}catch(IOException e){
			e.printStackTrace();
		}
		return prop;
	}
	
	
	
	

}
