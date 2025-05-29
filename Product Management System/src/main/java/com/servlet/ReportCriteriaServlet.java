package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/reportCriteria")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");

        // Set the report type as request attribute to decide in next servlet
        request.setAttribute("reportType", reportType);

        // Forward to ReportServlet which handles the actual data fetching & display
        RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
        dispatcher.forward(request, response);
    }
}
