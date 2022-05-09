//Melissa Simmonds 1503464

import java.io.*;
import java.nio.charset.StandardCharsets;

public class AddLine {

    static String lineToAdd = "//Melissa Simmonds 1503464\n"; //my name and id to be appended to the top of the files

    public static void main(String args[]) {
        //check that a filename has been given
        if (args.length != 1) {
            System.out.println("please make sure that a file has been inputted");
            System.exit(1); //exit because there is no file of that name
        }
        //check that the file exists
        String fileName = args[0];
        File file = new File(fileName);
        if (!file.exists()) {
            System.out.println("no file of that name found");
            System.exit(1); //exit because there is no file of that name
        }
        //then call the addName method
        addName(file);

    }

    public static void addName(File file) {
        try {
            FileInputStream fis = new FileInputStream(file);
            BufferedReader br = new BufferedReader(new InputStreamReader((fis)));
            String result = "";
            String line = "";
            while((line = br.readLine())!=null){
                result = result+line + '\n'; //needs a new line char added otherwise everythinmg is on one line
            }
            result = lineToAdd + result;
            file.delete();//delete the file so that the new one version can be added
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(result.getBytes(StandardCharsets.UTF_8));
            fos.flush();
        }catch (Exception e){
            System.out.println("exception error");
            e.printStackTrace();
        }
    }
}