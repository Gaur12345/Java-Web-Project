package connDAO;

import java.io.File;
import java.io.IOException;

public class FileCreate
{
	public static String path="E://eclipse//CollageProject//WebContent//";
	public static boolean success;
	public static String path3="",path2="";

	public  static void  createFile(String name)
	{
		System.out.println("top statge"+path);
		path=path+name;
		File dir = new File(path);
		path2=path;
		path3=path;
		System.out.println(path);
		if(dir.exists())
		{
			System.out.println("Folder is Exist");
			path=null;
			System.out.println("path is show "+path);
			
		}
		else
		{
			success = dir.mkdir();
			if(success)
			{
				System.out.println("folder is created");
				String s1="//ImageFolder";
				String s2="//PdfFolder";
				String s3="//ProgramFolder";
				
				path=path+s1;
				File imgdir=new File(path);
				success=imgdir.mkdir();
				
				path2=path2+s2;
				File pdfdir=new File(path2);
				success=pdfdir.mkdir();
				
				path3=path3+s3;
				File profile=new File(path3);
				success=profile.mkdir();
				
				System.out.println("all folder are created");
				System.out.println(path);
				path=null;
				path2=null;
				path3=null;
				s1=null;
				s2=null;
				s3=null;
				System.out.println("path value is "+path);
			}
		
		}
			
	}
	
}
