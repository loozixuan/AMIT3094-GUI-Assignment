package org.apache.jsp.Client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Client/./header.html");
    _jspx_dependants.add("/Client/./footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<!--\r\n");
      out.write("To change this license header, choose License Headers in Project Properties.\r\n");
      out.write("To change this template file, choose Tools | Templates\r\n");
      out.write("and open the template in the editor.\r\n");
      out.write("-->\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Hobbit Hall</title>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"> \r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script>\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <link href=\"home.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"base.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!--\r\n");
      out.write("To change this license header, choose License Headers in Project Properties.\r\n");
      out.write("To change this template file, choose Tools | Templates\r\n");
      out.write("and open the template in the editor.\r\n");
      out.write("-->\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\"> \r\n");
      out.write("        \r\n");
      out.write("    \r\n");
      out.write("        <header>\r\n");
      out.write("            <div class=\"header\">\r\n");
      out.write("                <div class=\"logo\">\r\n");
      out.write("                    <a href=\"home.jsp\"><img src=\"images/logo.png\" alt=\"logo\"></a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"searchBar\">\r\n");
      out.write("                    <input type=\"text\" name=\"search\" placeholder=\"Search\">\r\n");
      out.write("                    <div id=\"searchIconContainer\">\r\n");
      out.write("                        <i class=\"fa fa-search\" aria-hidden=\"true\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"header-right\">\r\n");
      out.write("                    <div class=\"col-1-2\">\r\n");
      out.write("                        <div style=\"display:flex;color:rgb(128, 128, 255)\">\r\n");
      out.write("                            <a href=\"login.jsp\"><div>Login </div></a><div>/ Signup</div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div>\r\n");
      out.write("                            <p id=\"myAccount\">My Account<p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-1-2\" id=\"cart\">\r\n");
      out.write("                        <i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i>\r\n");
      out.write("                        <div id=\"cartLabel\">Cart</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"navigation\">\r\n");
      out.write("                <ul class=\"nav-inner\">\r\n");
      out.write("                    <li class=\"nav-title \">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"#\" data-toggle=\"dropdown\"> English Books <i class=\"fa fa-chevron-down\" aria-hidden=\"true\"></a></i> \r\n");
      out.write("                        <div class=\"dropdown-item\">\r\n");
      out.write("                            <div class='row'>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-title \">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"#\" data-toggle=\"dropdown\"> Chinese Books <i class=\"fa fa-chevron-down\" aria-hidden=\"true\"></a></i> \r\n");
      out.write("                        <div class=\"dropdown-item\">\r\n");
      out.write("                             <div class='row'>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-title \">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"#\" data-toggle=\"dropdown\"> Malay Books <i class=\"fa fa-chevron-down\" aria-hidden=\"true\"></a></i> \r\n");
      out.write("                        <div class=\"dropdown-item\">\r\n");
      out.write("                             <div class='row'>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                                <div>ss</div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </header>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <main role=\"main\">\r\n");
      out.write("            <div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("                <ol class=\"carousel-indicators\">\r\n");
      out.write("                    <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("                    <li data-target=\"#myCarousel\" data-slide-to=\"1\"></li>\r\n");
      out.write("                    <li data-target=\"#myCarousel\" data-slide-to=\"2\"></li>\r\n");
      out.write("\r\n");
      out.write("                </ol>\r\n");
      out.write("                <div class=\"carousel-inner\">\r\n");
      out.write("                    <div class=\"carousel-item active\">\r\n");
      out.write("                        <img src=\"images/poster1.png\" alt=\"poster1\"/>\r\n");
      out.write("                        <svg class=\"bd-placeholder-img\" width=\"100%\" height=\"100%\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\" style=><rect width=\"100%\" height=\"100%\" fill=\"#777\"/></svg>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"carousel-item\">\r\n");
      out.write("                        <img src=\"images/poster2.png\" alt=\"poster2\"/>\r\n");
      out.write("\r\n");
      out.write("                        <svg class=\"bd-placeholder-img\" width=\"100%\" height=\"100%\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\"><rect width=\"100%\" height=\"100%\" fill=\"#777\"/></svg>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"carousel-item\">\r\n");
      out.write("                        <img src=\"images/poster3.png\" alt=\"poster3\"/>\r\n");
      out.write("                        <svg class=\"bd-placeholder-img\" width=\"100%\" height=\"100%\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\"><rect width=\"100%\" height=\"100%\" fill=\"#777\"/></svg>\r\n");
      out.write("                        <div class=\"container\">\r\n");
      out.write("                            <div class=\"carousel-caption text-right\">\r\n");
      out.write("                                <p><a class=\"btn btn-lg btn-primary\" href=\"../ProductDetails/productDetail.php?code=P1009\" role=\"button\" style=\" background-color: rgba(0,0,0,0.6);\">View more</a></p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <a class=\"carousel-control-prev\" href=\"#myCarousel\" role=\"button\" data-slide=\"prev\">\r\n");
      out.write("                    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("                    <span class=\"sr-only\">Previous</span>\r\n");
      out.write("                </a>\r\n");
      out.write("                <a class=\"carousel-control-next\" href=\"#myCarousel\" role=\"button\" data-slide=\"next\">\r\n");
      out.write("                    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("                    <span class=\"sr-only\">Next</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"collectionsContainer\">\r\n");
      out.write("                <div>\r\n");
      out.write("                    <p id=\"titleCollection\">Most Searched Collections</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"buttonCollectionsRow\">\r\n");
      out.write("                    <div class=\"buttonCollection-inner\">\r\n");
      out.write("                        <div class=\"buttonImgContainer\"><img src=\"images/buttonBusiness.png\" alt=\"buttonBusiness\"/></div>\r\n");
      out.write("                        <p class=\"buttonCollection\"><span>Business Management</span></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"buttonCollection-inner\">\r\n");
      out.write("                        <div class=\"buttonImgContainer\"><img src=\"images/buttonChildren.png\" alt=\"buttonChildren\"/></div>\r\n");
      out.write("                        <p class=\"buttonCollection\"><span>Children's Books</span></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"buttonCollection-inner\">\r\n");
      out.write("                        <div class=\"buttonImgContainer\"><img src=\"images/buttonNovel.png\" alt=\"buttonNovel\"/></div>\r\n");
      out.write("                        <p class=\"buttonCollection\"><span>Novel</span></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"buttonCollection-inner\">\r\n");
      out.write("                        <div class=\"buttonImgContainer\"><img src=\"images/buttonYoung.png\" alt=\"buttonYoung\"/></div>\r\n");
      out.write("                        <p class=\"buttonCollection\"><span>Young Adult</span></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"buttonCollection-inner\">\r\n");
      out.write("                        <div class=\"buttonImgContainer\"><img src=\"images/buttonSelf.png\" alt=\"buttonSelfHelp\"/></div>\r\n");
      out.write("                        <p class=\"buttonCollection\"><span>Self Help</span></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"buttonCollection-inner\">\r\n");
      out.write("                        <div class=\"buttonImgContainer\"><img src=\"images/buttonArt.png\" alt=\"buttonArt\"/></div>\r\n");
      out.write("                        <p class=\"buttonCollection\"><span>Art</span></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </main>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("<footer>\r\n");
      out.write("    <div class=\"footerPicture\"><img src=\"images/torn-border2upside.png\" alt=\"torn-border2upside\"></div>\r\n");
      out.write("    <div class=\"Footerrow\">\r\n");
      out.write("        <section class=\"icons\">\r\n");
      out.write("            <div>\r\n");
      out.write("                <a href=\"#\" target=\"windows\"><img src=\"images/fbIcons.png\" alt=\"facebook\"  style=\"padding-right: 20px;width:100%\"/></a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div>\r\n");
      out.write("                <a href=\"#\" target=\"windows\"><img src=\"images/igIcons.png\" alt=\"instagram\" style=\"padding-right: 20px;width:100%\"/></a>    \r\n");
      out.write("            </div>\r\n");
      out.write("            <div>\r\n");
      out.write("                <a href=\"#\" target=\"windows\"><img src=\"images/googleIcons.png\" alt=\"google\"  style=\"padding-right: 20px;width:100%\"/></a>    \r\n");
      out.write("            </div>\r\n");
      out.write("            <div>\r\n");
      out.write("                <a href=\"#\" target=\"windows\"><img src=\"images/tripadvisorIcons.png\" alt=\"tripadvisor\"  style=\"padding-right: 20px;width:100%\"/></a>    \r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("    </div>\r\n");
      out.write("    <br>\r\n");
      out.write("    <div class=\"link\" >\r\n");
      out.write("        <div class=\"column\"><a href=\"\">Contact Us</a></div>\r\n");
      out.write("        <div class=\"column\"><a href=\"\">Customer Help</a></div>\r\n");
      out.write("        <div class=\"column\"><a href=\"\">My Account</a></div>\r\n");
      out.write("    </div>      \r\n");
      out.write("    <br>\r\n");
      out.write("    <div class=\"footer-description\">\r\n");
      out.write("        <p style=\"color: rgb(190, 179, 179);\">Copyright &copy 2016-2018. All Rights Reserved by Kwong Tat. License of Kwong Tat Watches Store</p>\r\n");
      out.write("    </div>  \r\n");
      out.write("\r\n");
      out.write("    <div class=\"upIconContainer\"> <p class=\"upIcon\"><a href=\"#\">&#11014</a></p></div>\r\n");
      out.write("\r\n");
      out.write("</footer>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
