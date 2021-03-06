<%-- 
    Document   : PreInscripcion
    Created on : 24-ago-2016, 20:56:21
    Author     : wilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../util/Header.jsp"/>
        <script src="<%=request.getContextPath()%>/js/modulosPagos/TipoPago.js"></script>
        <script src="<%=request.getContextPath()%>/js/modulocolegiado/Persona.js"></script>
        <script src="<%=request.getContextPath()%>/js/modulocolegiado/Colegiado.js"></script>
        <script src="<%=request.getContextPath()%>/js/moduloreportes/listadoPagos.js"></script>
        <%
            Date fecha = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("MMyyyy");
        %>
    </head>
    <body>
        <header>
            <nav>
                <jsp:include page="../util/Navbar.jsp"/>
                <h3 class="page-header"><c:out value="${TituloModulo}" /></h3>
            </nav>
        </header>
        <section class="container">
            <div id = "panelError">
                
            </div>
            <div id = "panelGrabar">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center"><c:out value="${TituloModulo}" /></h3>
                    </div>
                    <div class="panel-body">
                         <div class="row form-group tipo"> 
                            <div class="col-lg-offset-3 col-lg-2">
                                <label>Tipo :</label>
                            </div>
                            <div class="col-lg-2">
                                 <input type="radio" name="tipoConcepto" id="chkConceptoCol" checked="checked"/>Colegiado
                            </div>
                            <div class="col-lg-2">
                                 <input type="radio" name="tipoConcepto" id="chkConceptoNoCol"/>Persona
                            </div>
                        </div>
                        <div class="row form-group reporte1">
                            <div class="col-lg-offset-3 col-lg-1">
                                <label>Colegiado:</label>
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <input type="text" id = "colegRep1" class="form-control" aria-label="..." VALUE="TODOS LOS COLEGIADO" readonly="true">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SELECCIONAR <span class="caret"></span></button>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li><a onClick="seleccionaColegiado(1)">NUMERO COLEGIATURA</a></li>
                                            <li><a onClick="seleccionaColegiado(2)">DNI</a></li>
                                            <li><a onClick="seleccionaColegiado(3)">TODOS LOS COLEGIADO</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                </div><!-- /input-group -->
                            </div>
                        </div>
                        <div class="row form-group reporte2">
                            <div class="col-lg-offset-3 col-lg-1">
                                <label>Persona:</label>
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <input type="text" id = "colegRep2" class="form-control" aria-label="..." VALUE="TODAS LAS PERSONAS" readonly="true">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SELECCIONAR <span class="caret"></span></button>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li><a onClick="seleccionaPersona(1)">DNI</a></li>
                                            <li><a onClick="seleccionaPersona(2)">TODAS LAS PERSONAS</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                </div><!-- /input-group -->
                            </div>
                        </div>
                        <div class="row form-group periodosDeuda"> 
                            <div class="col-lg-offset-3 col-lg-1">
                                <label>Periodo :</label>
                            </div>
                            <div class="col-lg-3">
                                 <input type="text" class="form-control" id="txtPeriodo" 
                                    value = "<%= sdf.format(fecha) %>" data-date-format="mmyyyy" readonly="true" maxlength="6">
                            </div>
                        </div>
                        <div class="row form-group pagos"> 
                            <div class="col-lg-offset-3 col-lg-1">
                                <label>Tipo Pagos :</label>
                            </div>
                            <div class="col-lg-5">
                                <select class="form-control" id="cboPagos">
                                </select>
                            </div>
                        </div> 
                        <div class="row form-group pagos"> 
                           <div class="col-lg-offset-3 col-lg-4">
                                <input type="checkbox" name="chkEstadoPago" id="chkEstadoPago"/><label>Incluir reversiones</label>
                            </div>
                        </div>     
                    </div>
                    <div class="panel-footer">
                        <div class="row form-group">
                            <div class=" col-lg-offset-3 col-lg-2" >
                                <button type="button" class="btn btn-primary btn-block" id="btnExportaExcel">Exportar XLS</button>
                            </div>
                            <div class="col-lg-offset-2 col-lg-2">
                                <button type="button" class="btn btn-primary btn-block" id="btnExportarPDF">Exportar PDF</button>
                            </div>
                        </div>   
                    </div>
                </div>
            </div>
            <div id="myModalColegiado" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">SELECCIONAR COLEGIADO</h4>
                        </div>
                        <div class="modal-body">
                            <div id = "panelErrorInt">
                
                            </div>
                            <br/>
                            <div class="row form-group"> 
                                <div class="col-lg-3">
                                    <label for="txtNum" id="labelNum"></label>
                                </div>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" id="txtNum" 
                                           name ="txtNum" maxlength="10">
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" class="btn btn-primary btn-block" id="btnBuscarColegiado">
                                        Buscar
                                    </button>
                                </div>
                            </div>
                            <div class="row form-group" id="divTabla"> 
                                
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row form-group">
                                <div class="col-lg-offset-3 col-lg-2">
                                    <button type="button" class="btn btn-primary btn-block" id="btnAceptarColegiado">
                                        Aceptar
                                    </button>
                                </div>
                                <div class="col-lg-offset-1 col-lg-2">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <div id="myModalPersona" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">SELECCIONAR PERSONA</h4>
                        </div>
                        <div class="modal-body">
                            <div id = "panelErrorInt">
                
                            </div>
                            <br/>
                            <div class="row form-group"> 
                                <div class="col-lg-3">
                                    <label for="txtNumDNI" id="labelNum">DNI</label>
                                </div>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" id="txtNumDNI" 
                                           name ="txtNumDNI" maxlength="8">
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" class="btn btn-primary btn-block" id="btnBuscarPersona">
                                        Buscar
                                    </button>
                                </div>
                            </div>
                            <div class="row form-group" id="divTablaPersona"> 
                                
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row form-group">
                                <div class="col-lg-offset-3 col-lg-2">
                                    <button type="button" class="btn btn-primary btn-block" id="btnAceptarPersona">
                                        Aceptar
                                    </button>
                                </div>
                                <div class="col-lg-offset-1 col-lg-2">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>                
        </section>
        <footer>
            <jsp:include page="../util/Footer.jsp"/>
        </footer>    
    </body>
</html>
