import com.movie.Showtime;
import com.movie.TheaterManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/TheaterServlet")
public class TheaterServlet extends HttpServlet {

    private TheaterManager manager = new TheaterManager();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {

            String theater = req.getParameter("theater");
            String time = req.getParameter("time");


            int showId = (int) (System.currentTimeMillis() % 100000);
            Showtime showtime = new Showtime(theater, time, showId);


            manager.addShow(showtime);


            res.sendRedirect("shows.jsp");

        } else if ("update".equals(action)) {
            // Update කරන්න
            int showId = Integer.parseInt(req.getParameter("showId"));
            String theater = req.getParameter("theater");
            String time = req.getParameter("time");

            manager.updateShow(showId, theater, time);
            res.sendRedirect("shows.jsp");
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int showId = Integer.parseInt(req.getParameter("showId"));
            manager.deleteShow(showId);
            res.sendRedirect("shows.jsp");
        } else {
            res.sendRedirect("shows.jsp");
        }
    }
}