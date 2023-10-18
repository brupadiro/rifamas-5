import '/components/secondaary_header_component_widget.dart';
import '/ff/ff_theme.dart';
import '/ff/ff_util.dart';
import '/ff/ff_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_page_model.dart';
export 'terms_page_model.dart';

class TermsPageWidget extends StatefulWidget {
  const TermsPageWidget({Key? key}) : super(key: key);

  @override
  _TermsPageWidgetState createState() => _TermsPageWidgetState();
}

class _TermsPageWidgetState extends State<TermsPageWidget> {
  late TermsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FFTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.secondaaryHeaderComponentModel,
                  updateCallback: () => setState(() {}),
                  child: SecondaaryHeaderComponentWidget(
                    title: 'Seguridad y privacidad',
                  ),
                ),
                Html(
                  data:
                      '<div class=\"elementor-text-editor elementor-clearfix\">\n\t\t\t\t<p><!-- wp:columns --></p>\n<div>\n<p><!-- wp:column {\"width\":\"100%\"} --></p>\n<div style=\"flex-basis: 100%;\">\n<p><!-- wp:heading {\"textAlign\":\"center\",\"level\":1} --></p>\n<h1><span style=\"color: #0286e7;\">Política de privacidad</span></h1>\n<p><!-- /wp:heading --></p>\n</div>\n<p><!-- /wp:column --></p>\n</div>\n<p><!-- /wp:columns -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>1. Identificación del Responsable de los Tratamientos</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>De acuerdo con lo establecido en REGLAMENTO (UE) 2016/679 DEL PARLAMENTO EUROPEO Y DEL CONSEJO de 27 de abril de 2016 relativo a la protección de las personas físicas en lo que respecta al tratamiento de datos personales y a la libre circulación de estos datos (en adelante RGPD) le informamos que los datos personales serán procesados por el siguiente Responsable del Tratamiento</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Nombre o Razón Social: RIFAMAS 2022, S.L. (RIFAMÁS)</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>CIF:&nbsp;B10666972.&nbsp;&nbsp;</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Dirección postal:&nbsp;Calle San Francisco, 30 esc. 1, planta 3, puerta A, 03001, Alicante, Alicante, España.&nbsp;</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Email para el ejercicio de derechos de los interesados:&nbsp;<a oncopy=\"return false\" onpaste=\"return false\" oncut=\"return false\">atencionalcliente<span>@</span>rifamas.es</a></li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>2. Principios generales de privacidad</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>Cuando recopilamos y procesamos su información personal, nos guiamos por los siguientes principios prácticos:</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Los datos personales son tratados de manera justa, legal y transparente.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Los datos personales se recogen con fines específicos, explícitos y legítimos y no son tratados de manera incompatible con dichos fines.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Los datos personales son adecuados, pertinentes y limitados a lo que es necesario en relación con los fines para los que se produce el tratamiento.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Los datos personales deben ser exactos y actualizados. Los datos inexactos serán actualizados o borrados.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Los datos personales deben mantenerse en un formato identificable para no más de lo necesario.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Los datos personales se mantienen seguros a través de medidas técnicas y organizativas adecuadas y eficaces contra el tratamiento no autorizado o ilícito y contra su pérdida, destrucción o daño accidental, mediante la aplicación de medidas técnicas u organizativas apropiadas (“integridad y confidencialidad”).</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Estamos comprometidos con los principios de protección de datos por diseño y protección de datos por defecto.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>3. Finalidades de la recogida de datos personales</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>Las finalidades según los tratamientos son las siguientes:</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Registro de usuarios: gestionar su registro de usuario y el desarrollo de la relación contractual en calidad de vendedor/promotor o como comprador/ participante.&nbsp;</li>\n<li>Contactos web: atender sus solicitudes, sugerencias, reclamaciones.&nbsp;</li>\n<li>Marketing incluso por medios electrónicos y redes sociales: el envío de ofertas de productos y servicios incluso por medios electrónicos.&nbsp;</li>\n<li>Publicación de datos identificativos/imagen de ganadores en web site.</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>4.- Legitimación para el tratamiento de los datos personales</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a>Registro de usuarios: gestionar su registro de usuario y el desarrollo de la relación contractual en calidad de vendedor/promotor o como comprador/ participante.&nbsp;</a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a>Contactos web: atender sus solicitudes, sugerencias, reclamaciones.&nbsp;</a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a>Marketing incluso por medios electrónicos y redes sociales: el envío de ofertas de productos y servicios incluso por medios electrónicos.&nbsp;</a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a>Publicación de datos identificativos/imagen de ganadores en web site: interés legítimo de responsable</a></li>\n</ul>\n<p>habida cuenta de la necesidad de transparencia en las promociones de terceros.</p>\n<p>&nbsp;</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>5. Destinatarios y transferencias internacionales de datos</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>No está prevista la comunicación a terceros, salvo obligación legal, y salvo en lo que respecta a la publicación de datos identificativos de ganadores y a la identificación de organizadores de promociones como rifas o sorteos, cuyos datos podrán ser comunicados a los participantes que lo soliciten. No se realizarán transferencias internacionales de datos, salvo si se publican datos identificativos de ganadores en redes sociales. En caso de cesiones necesarias, éstas podrán realizarse a entidades bancarias, Administración Tributaria, entre otros, y según el tipo de tratamiento.&nbsp;&nbsp;</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>6. Elaboración de perfiles y decisiones automatizadas&nbsp;</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>En ninguno de los tratamientos está previsto realizar perfiles ni adoptar decisiones automatizadas.</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:heading --></p>\n<h2><span style=\"color: #0286e7;\"><strong>7. Plazos de conservación</strong></span></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a><span style=\"font-size: revert;\">Registro de usuarios: mientras se mantenga vigente la finalidad, sin perjuicio de los plazos de prescripción legal.</span></a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a><span style=\"font-size: revert;\">Contactos web: mientras los datos sean necesarios para gestionar su solicitud.&nbsp;</span></a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a><span style=\"font-size: revert;\">Marketing incluso por medios electrónicos: los datos se conservarán mientras no conste la baja del interesado. Se recuerda a los interesados que pueden darse de baja de las comunicaciones comerciales en cualquier momento.</span></a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>&nbsp;</p>\n<ul>\n<li><a><span style=\"font-size: revert;\">Publicación de datos identificativos/imagen de ganadores en web site: dos meses</span></a></li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:heading {\"textColor\":\"vivid-cyan-blue\"} --></p>\n<h2><strong>8. Derechos del Interesado</strong></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>Como interesado, podrá dirigir sus comunicaciones y ejercitar sus derechos siguiendo las formalidades impuestas por el REGLAMENTO (UE) 2016/679 DEL PARLAMENTO EUROPEO Y DEL CONSEJO de 27 de abril de 2016 relativo a la protección de las personas físicas en lo que respecta al tratamiento de datos personales y a la libre circulación de estos datos.&nbsp;</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph --></p>\n<p>En todas nuestras operaciones relacionadas con su privacidad, nos esforzamos por cumplir con la normativa actual, la cual contiene una serie de derechos para el interesado que a continuación enumeramos:</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:table --></p>\n<figure>\n<table>\n<thead>\n<tr>\n<td><strong>Sus derechos</strong></td>\n<td><strong>¿Qué significa?</strong></td>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><strong>Derecho de información</strong></td>\n<td>Tiene derecho a que se le presente la información clara, concisa, transparente y fácil de entender sobre la forma en que usamos sus datos personales y sobre sus derechos.&nbsp;</td>\n</tr>\n<tr>\n<td><strong>Derecho de acceso</strong></td>\n<td>Tiene derecho a acceder a los datos personales que tenemos de usted (con ciertos límites).Las solicitudes manifiestamente infundadas, excesivas o repetitivas podrán no ser atendidas.</td>\n</tr>\n<tr>\n<td><strong>Derecho de rectificación</strong></td>\n<td>Tiene derecho a hacer que se rectifiquen sus datos personales cuando sean inexactos o hayan dejado de ser válidos o a hacer que se completen cuando sean incompletos.</td>\n</tr>\n<tr>\n<td><strong>Derecho de supresión / derecho al olvido</strong></td>\n<td>En determinados casos, le corresponde el derecho a solicitar que sus datos personales sean borrados o eliminados. Es preciso señalar que no se trata de un derecho absoluto, puesto que podremos tener motivos legales o legítimos para conservarlos.</td>\n</tr>\n<tr>\n<td><strong>Derecho de oposición a recibir publicidad</strong></td>\n<td>Puede darse de baja de nuestras comunicaciones de marketing en cualquier momento.La forma más sencilla para poder de darse de baja es haciendo clic sobre el enlace “baja” en cualquier correo electrónico o comunicación que le enviemos. También puede enviarnos un correo electrónico a&nbsp;&nbsp;<a>atencionalcliente@rifamas.es</a></td>\n</tr>\n<tr>\n<td><strong>Derecho a retirar el consentimiento en cualquier momento cuando el tratamiento de datos esté basado en el consentimiento</strong></td>\n<td>En el caso de que se haya otorgado el consentimiento para alguna de las finalidades informadas y determinadas en los tratamientos a los que hacemos referencia, le informamos que tiene derecho a retirar el consentimiento en cualquier momento, sin que ello afecte a la legalidad del tratamiento basado en el consentimiento previo a su retirada.</td>\n</tr>\n<tr>\n<td><strong>Derecho de oposición al tratamiento basado en la satisfacción de intereses legítimos</strong></td>\n<td>Puede oponerse en cualquier momento a que tratemos sus datos cuando el tratamiento esté basado en la satisfacción de intereses legítimos.&nbsp;</td>\n</tr>\n<tr>\n<td><strong>Derecho a presentar una reclamación ante una autoridad de control</strong></td>\n<td>Asimismo, le informamos que cuando no haya obtenido satisfacción en el ejercicio de sus derechos o la forma de ejercerlos, podrá presentar una reclamación ante la Autoridad de Control. Si quiere conocer más información sobre este derecho y como ejercerlo puede dirigirse a la a la Agencia Española de Protección de Datos&nbsp;<a href=\"http://www.aepd.es/\">www.aepd.es</a>&nbsp;&nbsp;Tel. 901 100 099 y 91.266.35.17. C/Jorge Juan,6 28001-Madrid.No dude en ponerse en contacto con nosotros por cualquiera de los medios abajo indicados antes de presentar una reclamación ante la autoridad competente en materia de protección de datos.</td>\n</tr>\n<tr>\n<td><strong>Derecho a la portabilidad de los datos</strong></td>\n<td>Tiene derecho a recibir los datos personales que le incumban y que nos haya facilitado en un formato estructurado, de uso común y lectura mecánica, para poder transmitirlos a otro responsable del tratamiento, cuando el tratamiento esté basado en la ejecución de un contrato o en su consentimiento y el tratamiento se realice por medios automatizados.&nbsp;</td>\n</tr>\n<tr>\n<td><strong>Derecho de limitación del tratamiento</strong></td>\n<td>Tiene derecho a solicitar la limitación del tratamiento de sus datos. Si ejerce este derecho, el tratamiento de sus datos estará sujeto a limitaciones, por lo que podremos almacenarlos, pero no podremos seguir usándolos ni tratándolos.Este derecho solo puede ejercerse en determinadas circunstancias definidas por el Reglamento General de Protección de Datos, como sigue:que el interesado impugne la exactitud de los datos personales, durante el plazo que permita al responsable verificar la exactitud de los mismos;que el tratamiento sea ilícito y el interesado se oponga a la supresión de los datos personales y solicite en su lugar la limitación de su uso;que el responsable ya no necesite los datos personales para los fines del tratamiento, pero el interesado los necesite para la formulación, el ejercicio o la defensa de reclamaciones;que el interesado se haya opuesto al tratamiento en virtud del artículo 21, apartado 1, mientras se verifica si los motivos legítimos del responsable prevalecen sobre los del interesado.</td>\n</tr>\n</tbody>\n</table>\n</figure>\n<p><!-- /wp:table -->\n\n<!-- wp:paragraph --></p>\n<p>¿Cómo puede ejercitar sus derechos de protección de datos?</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph --></p>\n<p>Para ejercitar los derechos deberá presentar un escrito en la dirección&nbsp;postal del Responsable del Tratamiento o a través de correo electrónico:&nbsp;<a>atencionalcliente@rifamas.es</a>&nbsp;indicando en el asunto “RGPD. DERECHOS”. Deberá especificar cuál de los derechos solicita que sea satisfecho y, a su vez, deberá acompañarse de la fotocopia del DNI o documento identificativo equivalente. En caso de que actuara mediante representante, legal o voluntario, deberá aportar también documento que acredite la representación y documento identificativo del mismo. Puede utilizar un modelo oficial de la AEPD<a href=\"https://www.aepd.es/reglamento/derechos/index.html\">https://www.aepd.es/reglamento/derechos/index.html</a></p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph --></p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:heading {\"textColor\":\"vivid-cyan-blue\"} --></p>\n<h2><strong>9. Seguridad</strong></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>Las medidas de seguridad adoptadas son aquellas requeridas, de conformidad con lo establecido en el artículo 32 del RGPD. En este sentido, teniendo en cuenta el estado de la técnica, los costes de aplicación y la naturaleza, el alcance, el contexto y los fines del tratamiento, así como los riesgos de probabilidad y gravedad variables para los derechos y las libertades de las personas físicas, tiene establecidas las medidas técnicas y organizativas apropiadas para garantizar el nivel de seguridad adecuado al riesgo existente.</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"textColor\":\"black\"} --></p>\n<p>El Responsable del Tratamiento tiene implementados los mecanismos suficientes para:</p>\n<ul>\n<li>Garantizar la confidencialidad, integridad, disponibilidad y resiliencia permanentes de los sistemas y servicios de tratamiento.</li>\n<li>Restaurar la disponibilidad y el acceso a los datos personales de forma rápida, en caso de incidente físico o técnico.</li>\n<li>Verificar, evaluar y valorar, de forma regular, la eficacia de las medidas técnicas y organizativas implantadas para garantizar la seguridad del tratamiento.</li>\n<li>Seudonimizar y cifrar los datos personales, en su caso.</li>\n</ul>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:heading {\"textColor\":\"vivid-cyan-blue\"} --></p>\n<h2><strong>10. Redes Sociales</strong></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>Los fans o seguidores en las distintas redes sociales y en el contexto de este tratamiento deben considerar que el Responsable del Tratamiento puede consultar o dar de baja sus datos de forma restringida al tener un perfil específico. Cualquier rectificación de sus datos o restricción de información o de publicaciones debe realizarla a través de la configuración de su perfil o usuario en la propia red social.&nbsp;</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:paragraph --></p>\n<p>Por lo tanto, los fans/seguidores consienten:</p>\n<p><!-- /wp:paragraph -->\n\n<!-- wp:list --></p>\n<ul>\n<li>Al tratamiento de sus datos personales en el entorno de dicha red social y conforme a sus propias políticas de Privacidad.</li>\n<li>El acceso por parte del Responsable del Tratamiento&nbsp;a los datos contenidos en su perfil o biografía, dependiendo de la configuración que tenga de su privacidad en cada red.</li>\n<li>A que las noticias publicadas sobre nuestros eventos o nuestros comentarios pueda aparecer en su muro o biografía.</li>\n<li>En caso de que se utilice un formulario específicamente creado para acciones promocionales o para otro tipo de finalidades, los datos recogidos se tratarán de acuerdo a la política de protección de datos del Responsable del Tratamiento.&nbsp;</li>\n</ul>\n<p><!-- /wp:list -->\n\n<!-- wp:paragraph --></p>\n<p>Si quieres dejar de seguirnos, sólo tienes que pinchar la opción&nbsp;<strong>“Dejar de ser fan”</strong>&nbsp;o&nbsp;<strong>“dejar de seguir”</strong>&nbsp;o similar.&nbsp;</p>\n<h2><strong>11. Plataformas de aplicaciones</strong></h2>\n<p><!-- /wp:heading -->\n\n<!-- wp:paragraph --></p>\n<p>Las plataformas proveedoras de aplicaciones como “App Store” de Apple o “Google Play” de Android (Google) no tienen ninguna participación y no patrocinan los productos publicados en este sitio.</p>\n<p><!-- /wp:paragraph --></p>\t\t\t\t\t</div>',
                  onLinkTap: (url, context, attributes, element) =>
                      launchURL(url!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
