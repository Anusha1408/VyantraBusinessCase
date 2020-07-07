package controller.admin.delete;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.HibernateUtil;

import model.dao.ProductPhotoDAO;

import model.to.ProductPhoto;
import operational.Checks;

/**
 * Servlet implementation class DeletePhoto
 */
@WebServlet("/admin/deleteProductPhoto")
public class DeleteProductPhoto extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String photoid = request.getParameter("photoid");
        if (photoid != null) {
            if (Checks.isNumeric(photoid)) {
                int pid = Integer.parseInt(photoid);
                ProductPhotoDAO action = new ProductPhotoDAO();
                ProductPhoto data = ProductPhotoDAO.getRecord(pid);
                if (data != null) {
                    if (HibernateUtil.deleteRecord(data)) {
                        request.setAttribute("message", "Photo is Deleted");
                        String path = "/upimages/" + data.getPhotoId() + "." + data.getExtNam();
                        path = getServletContext().getRealPath(path);
                        File file = new File(path);
                        file.delete();
                    } else {
                        request.setAttribute("message", HibernateUtil.getErrormessage());
                    }
                }
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("viewproductphoto.jsp");
        rd.forward(request, response);
    }

}
