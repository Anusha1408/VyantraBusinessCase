package controller.admin.insert;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.dao.HibernateUtil;
import model.dao.ProductInfoDAO;

import operational.Checks;
import model.dao.ProductPhotoDAO;
import model.to.ProductPhoto;

/**
 * Servlet implementation class InsertPhotoInfo
 */
@WebServlet("/admin/insertProductPhoto")
@MultipartConfig
public class InsertProductPhoto extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part p = request.getPart("file");
        String productid = request.getParameter("productid");
        if (p != null && productid != null) {
            if (p.getInputStream() instanceof FileInputStream && Checks.isNumeric(productid)) {
                String filename = getFileName(p);
                String extname = filename.substring(filename.lastIndexOf(".") + 1);
                ProductPhoto data = new ProductPhoto();
                data.setProduct(ProductInfoDAO.getRecord(Integer.parseInt(productid)));
                data.setPhotoName(filename);
                data.setExtNam(extname);
                if (HibernateUtil.insertRecord(data)) {
                    int id = data.getPhotoId();
                    if (id != 0) {
                        String path = "/upimages/" + id + "." + extname;
                        path = getServletContext().getRealPath(path);
                        FileOutputStream fout = new FileOutputStream(path);
                        InputStream is = p.getInputStream();
                        int i = is.read();
                        while (i != -1) {
                            fout.write(i);
                            i = is.read();
                        }
                        fout.close();
                        request.setAttribute("message", "Photo has been uploaded");
                    } else {
                        request.setAttribute("message", HibernateUtil.getErrormessage());
                    }
                } else {
                    request.setAttribute("message", HibernateUtil.getErrormessage());
                }
            }else{
                request.setAttribute("message", "Please Provide Any Photo");
            }
        } else {
            request.setAttribute("message", "Please Choose Some Product Name");
        }
        RequestDispatcher rd = request.getRequestDispatcher("fetchProductInfoForProductPhoto");
        rd.forward(request, response);
    }

    private String getFileName(Part p) {
        String value = p.getHeader("content-disposition");
        if (value != null) {
            value = value.substring(value.lastIndexOf("=") + 1);
            String filename = value.replace("\"", "");
            return filename;
        }
        return null;
    }

}
