<DOCFLEX_TEMPLATE VER='1.19'>
CREATED='2005-04-26 03:31:00'
LAST_UPDATE='2014-07-05 20:02:58'
DESIGNER_TOOL='DocFlex SDK 1.x'
DESIGNER_LICENSE_TYPE='Filigris Works Team'
APP_ID='docflex-xml-wsdldoc'
APP_NAME='DocFlex/XML WSDLDoc'
APP_VER='1.0.b'
APP_AUTHOR='Copyright © 2014 Filigris Works, Leonid Rudy Softwareprodukte. All rights reserved.'
FEATURE_TYPE='pro'
TEMPLATE_TYPE='DocumentTemplate'
DSM_TYPE_ID='wsdldoc'
ROOT_ET='xs:group'
TITLE_EXPR='title = getStringParam("$title");

(parentTitle = getStringParam("docTitle")) != null
  ? title + " | " + parentTitle : title'
HTML_HEAD_EXPR='title = getStringParam("$title");

(parentTitle = getStringParam("docTitle")) != null
  ? title = title + " | " + parentTitle;

\'<script type="text/javascript">
    window.onload = function() {
        parent.document.title="\' + encodeJScriptString (title) + \'";
    }
</script>\''
<TEMPLATE_PARAMS>
	PARAM={
		param.name='$mainXML';
		param.type='GOMElement';
		param.defaultValue.expr='findElementByKey ("main-xmls", getXMLDocument().id)';
	}
	PARAM={
		param.name='$nsURI';
		param.title='Target Namespace URI';
		param.type='string';
		param.defaultValue.expr='findAncestor("xs:schema").getServiceAttr("targetNamespace")';
		param.hidden='true';
	}
	PARAM={
		param.name='$xmlName';
		param.description='Displayed XML name (qualified or local) of the group';
		param.type='string';
		param.defaultValue.expr='toXMLName (getStringParam("$nsURI"), getAttrStringValue("name"))';
		param.fixed='true';
		param.hidden='true';
	}
	PARAM={
		param.name='$title';
		param.title='Component\'s doc title';
		param.type='string';
		param.defaultValue.expr='\'group "\' + getParam("$xmlName") + \'"\'
+ 
(hasServiceAttr ("redefinition") ?
  \' \' + callStockSection("redefinition") : "")';
	}
	PARAM={
		param.name='$usageCount';
		param.description='number of locations where this element group is used';
		param.type='integer';
		param.defaultValue.expr='countElementsByKey ("xsd-group-usage", contextElement.id)';
		param.fixed='true';
		param.hidden='true';
	}
	PARAM={
		param.name='$contentModelKey';
		param.title='map key for "xsd-content-model-elements"';
		param.description='The key for "xsd-content-model-elements" map to find items associated with this component';
		param.type='Object';
		param.defaultValue.expr='contextElement.id';
		param.fixed='true';
	}
	PARAM={
		param.name='$elementCount';
		param.title='number of all content elements';
		param.description='total number of content elements declared for this component';
		param.type='integer';
		param.defaultValue.expr='countElementsByKey (
  "xsd-content-model-elements",
  getParam("$contentModelKey"),
  BooleanQuery (! instanceOf ("xs:any"))
)';
		param.fixed='true';
		param.hidden='true';
	}
	PARAM={
		param.name='$elementWildcardCount';
		param.title='number of all element wildcards';
		param.description='total number of element wildcards declared for this component';
		param.type='integer';
		param.defaultValue.expr='countElementsByKey (
  "xsd-content-model-elements",
  getParam("$contentModelKey"),
  BooleanQuery (instanceOf ("xs:any"))
)';
		param.fixed='true';
		param.hidden='true';
	}
	PARAM={
		param.name='$ownElementCount';
		param.title='number of elements defined in this component';
		param.type='integer';
		param.defaultValue.expr='countElementsByKey (
  "xsd-content-model-elements",
  getParam("$contentModelKey"),
  BooleanQuery (
    ! instanceOf ("xs:any") &&
    findPredecessorByType("xs:%element|xs:complexType|xs:group").id 
    == rootElement.id
  )
)';
		param.fixed='true';
		param.hidden='true';
	}
	PARAM={
		param.name='$ownElementWildcardCount';
		param.title='number of element wildcards defined in this component';
		param.type='integer';
		param.defaultValue.expr='countElementsByKey (
  "xsd-content-model-elements",
  getParam("$contentModelKey"),
  BooleanQuery (
    instanceOf ("xs:any") &&
    findPredecessorByType("xs:%element|xs:complexType|xs:group").id 
    == rootElement.id
  )
)';
		param.fixed='true';
		param.hidden='true';
	}
	PARAM={
		param.name='docTitle';
		param.title='Documentation Title';
		param.type='string';
	}
	PARAM={
		param.name='doc.xsd.comp';
		param.title='Schema Component';
		param.title.style.bold='true';
		param.group='true';
		param.group.defaultState='expanded';
	}
	PARAM={
		param.name='doc.xsd.comp.profile';
		param.title='Component Profile';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.diagram';
		param.title='Diagram';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.xmlRep';
		param.title='XML Representation Summary';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.xmlRep.for.group';
		param.title='Generate For Element Groups';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.lists';
		param.title='Lists of Related Components';
		param.title.style.bold='true';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.lists.contentElements';
		param.title='List of Content Elements';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.usage';
		param.title='Usage / Definition Locations';
		param.group='true';
		param.group.defaultState='expanded';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.usage.for.group';
		param.title='Element Groups';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.usage.layout';
		param.title='List Layout';
		param.title.style.italic='true';
		param.type='enum';
		param.enum.values='flow;one_column;two_columns;optimal';
		param.defaultValue='optimal';
	}
	PARAM={
		param.name='doc.xsd.comp.annotation';
		param.title='Annotation';
		param.group='true';
		param.group.defaultState='expanded';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.annotation.for.group';
		param.title='Element Groups';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.xml';
		param.title='XML Source';
		param.title.style.bold='true';
		param.group='true';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.xml.box';
		param.title='Enclose in Box';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.xml.remove.xsd.anns';
		param.title='Remove <xs:annotation>';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.contentElements';
		param.title='Content Element Detail';
		param.title.style.bold='true';
		param.group='true';
		param.group.defaultState='expanded';
		param.type='boolean';
	}
	PARAM={
		param.name='doc.xsd.comp.contentElements.for';
		param.title='Generate For';
		param.title.style.italic='true';
		param.group='true';
		param.group.defaultState='expanded';
	}
	PARAM={
		param.name='doc.xsd.comp.contentElements.for.group';
		param.title='Element Groups';
		param.title.style.italic='true';
		param.type='boolean';
	}
	PARAM={
		param.name='fmt';
		param.title='Formatting';
		param.title.style.bold='true';
		param.group='true';
	}
	PARAM={
		param.name='fmt.page.refs';
		param.title='Generate page references';
		param.type='boolean';
	}
	PARAM={
		param.name='show';
		param.title='Show';
		param.title.style.bold='true';
		param.group='true';
		param.group.defaultState='expanded';
	}
	PARAM={
		param.name='show.localElementExt';
		param.title='Local Element Extensions';
		param.type='enum';
		param.enum.values='always;repeating;never';
	}
	PARAM={
		param.name='show.about';
		param.title='About (footer)';
		param.type='boolean';
	}
</TEMPLATE_PARAMS>
<STYLES>
	CHAR_STYLE={
		style.name='Code';
		style.id='cs1';
		text.font.name='Courier New';
		text.font.size='9';
	}
	CHAR_STYLE={
		style.name='Default Paragraph Font';
		style.id='cs2';
		style.default='true';
	}
	PAR_STYLE={
		style.name='Detail Heading 1';
		style.id='s1';
		text.font.size='12';
		text.font.style.bold='true';
	}
	PAR_STYLE={
		style.name='Detail Heading 2';
		style.id='s2';
		text.font.size='10';
		text.font.style.bold='true';
		par.bkgr.opaque='true';
		par.bkgr.color='#EEEEFF';
		par.border.style='solid';
		par.border.color='#666666';
		par.margin.top='10';
		par.margin.bottom='8.3';
		par.padding.left='1.7';
		par.padding.right='1.7';
		par.padding.top='1.7';
		par.padding.bottom='1.7';
		par.page.keepWithNext='true';
	}
	CHAR_STYLE={
		style.name='Hyperlink';
		style.id='cs3';
		text.decor.underline='true';
		text.color.foreground='#0000FF';
	}
	PAR_STYLE={
		style.name='List Heading 2';
		style.id='s3';
		text.font.name='Arial';
		text.font.size='9';
		text.font.style.bold='true';
		par.margin.bottom='6.7';
		par.page.keepWithNext='true';
	}
	PAR_STYLE={
		style.name='Main Heading';
		style.id='s4';
		text.font.name='Verdana';
		text.font.size='13';
		text.font.style.bold='true';
		text.color.foreground='#4477AA';
		par.bkgr.opaque='true';
		par.bkgr.color='#EEEEEE';
		par.border.style='solid';
		par.border.color='#4477AA';
		par.margin.top='0';
		par.margin.bottom='7.5';
		par.padding.left='4.2';
		par.padding.right='4.2';
		par.padding.top='2.5';
		par.padding.bottom='2.5';
		par.page.keepWithNext='true';
	}
	PAR_STYLE={
		style.name='Normal';
		style.id='s5';
		style.default='true';
	}
	CHAR_STYLE={
		style.name='Note Font';
		style.id='cs4';
		text.font.name='Arial';
		text.font.size='8';
		text.font.style.bold='false';
	}
	CHAR_STYLE={
		style.name='Page Header Font';
		style.id='cs5';
		text.font.name='Arial';
		text.font.style.italic='true';
	}
	CHAR_STYLE={
		style.name='Page Number Small';
		style.id='cs6';
		text.font.name='Courier New';
		text.font.size='8';
	}
</STYLES>
FMT={
	doc.lengthUnits='pt';
	doc.hlink.style.link='cs3';
}
<HTARGET>
	HKEYS={
		'contextElement.id';
		'"detail"';
	}
</HTARGET>
<PAGE_HEADER>
	<AREA_SEC>
		FMT={
			text.style='cs5';
			table.cell.padding.both='0';
			table.border.style='none';
			table.border.bottom.style='solid';
		}
		<AREA>
			<CTRL_GROUP>
				FMT={
					par.border.bottom.style='solid';
				}
				<CTRLS>
					<DATA_CTRL>
						FORMULA='getParam("$title")'
						FMT={
							text.font.style.italic='true';
						}
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
</PAGE_HEADER>
<ROOT>
	<AREA_SEC>
		FMT={
			par.style='s4';
		}
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<DATA_CTRL>
						FORMULA='getParam("$title")'
					</DATA_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<TEMPLATE_CALL>
		DESCR='Element Group Profile'
		COND='getBooleanParam("doc.xsd.comp.profile")'
		ON_OUTPUT_EXPR='thisContext.setVar ("has-profile", true)'
		TEMPLATE_FILE='groupProfile.tpl'
	</TEMPLATE_CALL>
	<FOLDER>
		DESCR='Diagram / Content Model'
		COLLAPSED
		FMT={
			sec.spacing.before='10';
			sec.spacing.after='10';
		}
		<BODY>
			<TEMPLATE_CALL>
				DESCR='Diagram'
				COND='getBooleanParam("doc.xsd.comp.diagram")'
				ON_OUTPUT_EXPR='thisContext.setVar ("has-content-model-diagram", true)'
				TEMPLATE_FILE='../component/diagram.tpl'
				<HTARGET>
					COND='output.type == "document"'
					HKEYS={
						'contextElement.id';
						'"content-model-diagram"';
					}
					NAME_EXPR='"content_model_diagram"'
				</HTARGET>
			</TEMPLATE_CALL>
			<TEMPLATE_CALL>
				DESCR='XML Representation Summary'
				COND='getBooleanParam("doc.xsd.comp.xmlRep") &&
getBooleanParam("doc.xsd.comp.xmlRep.for.group")'
				ON_OUTPUT_EXPR='thisContext.setVar ("has-xml-rep-summary", true)'
				TEMPLATE_FILE='../content/xmlRep.tpl'
				<HTARGET>
					COND='output.type == "document"'
					HKEYS={
						'contextElement.id';
						'"xml-rep-summary"';
					}
					NAME_EXPR='"xml_rep_summary"'
				</HTARGET>
			</TEMPLATE_CALL>
		</BODY>
	</FOLDER>
	<FOLDER>
		DESCR='Lists of Related Components'
		COND='getBooleanParam("doc.xsd.comp.lists")'
		COLLAPSED
		<BODY>
			<TEMPLATE_CALL>
				DESCR='Content Element List'
				COND='getBooleanParam("doc.xsd.comp.lists.contentElements")'
				TEMPLATE_FILE='../element/contentElementList.tpl'
			</TEMPLATE_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				COND='(thisContext.checkVar ("has-profile") ||
 thisContext.checkVar ("has-content-model-diagram"))
&&
! thisContext.checkVar ("has-xml-rep-summary")'
				FMT={
					sec.outputStyle='pars';
				}
				<AREA>
					<HR>
						FMT={
							par.margin.top='10';
							par.margin.bottom='10';
						}
					</HR>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<FOLDER>
		DESCR='Usage Locations'
		COND='getBooleanParam("doc.xsd.comp.usage") &&
getBooleanParam("doc.xsd.comp.usage.for.group")
&&
getIntParam("$usageCount") > 0'
		COLLAPSED
		FMT={
			sec.outputStyle='list';
			list.item.margin.top='8.3';
			list.item.margin.bottom='8.3';
		}
		<HTARGET>
			HKEYS={
				'contextElement.id';
				'"usage-locations"';
			}
		</HTARGET>
		<BODY>
			<SS_CALL>
				DESCR='in other groups'
				COND='e = findElementsByKey (
      "xsd-group-usage",
      contextElement.id,
      BooleanQuery (instanceOf ("xs:group"))
    );

e.hasNext() ?
{
  v = e.toVector();

  v.sortVector (
    @(GOMElement) el,
    FlexQuery (el.callStockSection ("Component Name"))
  );

  thisContext.setVar ("locations", v);
  true

} : false'
				SS_NAME='Usage Location List'
				PARAMS_EXPR='Array (
  "In definitions of other model groups",
  getParam("doc.xsd.comp.usage.layout"),
  thisContext.getVar ("locations")
)'
			</SS_CALL>
			<SS_CALL>
				DESCR='in global complexTypes'
				COND='e = findElementsByKey (
      "xsd-group-usage",
      contextElement.id,
      BooleanQuery (instanceOf ("xs:complexType"))
    );

e.hasNext() ?
{
  v = e.toVector();

  v.sortVector (
    @(GOMElement) el,
    FlexQuery (el.callStockSection ("Component Name"))
  );

  thisContext.setVar ("locations", v);
  true

} : false'
				SS_NAME='Usage Location List'
				PARAMS_EXPR='Array (
  "In definitions of global complexTypes",
  getParam("doc.xsd.comp.usage.layout"),
  thisContext.getVar ("locations")
)'
			</SS_CALL>
			<SS_CALL>
				DESCR='in anonymous complexTypes of elements'
				COND='e = findElementsByKey (
      "xsd-group-usage",
      contextElement.id,
      BooleanQuery (instanceOf ("xs:%element"))
    );

e.hasNext() ? {

  mainXMLFilter = BooleanQuery (checkElementByKey (
                    "main-xmls",
                    getXMLDocument().id,
                    getElementParam("$mainXML")
                  ));

  nameExt = null;

  /* This variable accumulates the maximal normalized length of element display names.
   For an element, the normalized display name length is calculated
   as the number of characters of the element\'s main name plus
   (in the case of a local element with the name extension)
   the number of character of the local element name extension multiplied by 0.8
  */
  nameLenMax = 0;

  v = e.toVector();

  // sort locations according to the containing element\'s name
  v.sortVector (
    @(GOMElement) el,
    FlexQuery ({
      name = el.getAttrStringValue("name");
      schema = el.findAncestor ("xs:schema");
      targetNS = schema.getServiceAttr("targetNamespace").toString();

      el.instanceOf ("xs:element") ?
      {
        // case of global element

        displayName = toXMLName (targetNS, name, Array (rootElement, el));
        nameLen = displayName.length()

      } : {
        // case of local element

        form = el.hasAttr("form") ? el.getAttrValue("form")
                  : schema.getAttrValue ("elementFormDefault");

        displayName = (form == "qualified") ? 
                         toXMLName (targetNS, name, Array (rootElement, el)) : name;

        nameLen = displayName.length();
         
        // if there is local element name extension

        (hasParamValue("show.localElementExt", "always")
         ||
         hasParamValue("show.localElementExt", "repeating") &&
         {
           qName = QName (form == "qualified" ? targetNS : "", name);

           countElementsByKey ("xsd-global-elements", qName, mainXMLFilter) +
           countElementsByKey ("xsd-local-elements", qName, mainXMLFilter) > 1
         }
        ) ? {
          nameExt = el.callStockSection ("localElementExt");
          displayName = displayName + nameExt;

          nameLen = nameLen + round (nameExt.length() * 0.8);
        }
      };

      nameLenMax < nameLen ? nameLenMax = nameLen;

      displayName
    })
  );

  thisContext.setVar ("locations", v); 

  /* The actual list layout:

   - If the list consist of the only element, the layout is \'flow\'
   - If the specified layout was \'optimal\', calculate the actual layout as follows:

     1). If there are no local element name extensions, use \'flow\' layout
     2). If maximal normalized length of element display names in the list exceeds 50,
         use \'one_column\' layout
     3). Otherwise, use \'two_columns\' layout

   - Otherwise, use the specified layout
  */

  thisContext.setVar (
    "listLayout", 
    (v.size() == 1 ? "flow" :
       hasParamValue("doc.xsd.comp.usage.layout", "optimal") ?
         nameExt == null ? "flow" : nameLenMax > 50 ? "one_column" : "two_columns"
       : getStringParam("doc.xsd.comp.usage.layout"))
  );

  true;

} : false'
				SS_NAME='Usage Location List'
				PARAMS_EXPR='Array (
  "In definitions of anonymous complexTypes of elements",
  thisContext.getVar ("listLayout"),
  thisContext.getVar ("locations")
)'
			</SS_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s2';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							trow.bkgr.color='#CCCCFF';
						}
						<CTRLS>
							<TEXT_CTRL>
								TEXT='Known Usage Locations'
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<FOLDER>
		DESCR='Annotation'
		COND='getBooleanParam("doc.xsd.comp.annotation") &&
getBooleanParam("doc.xsd.comp.annotation.for.group")'
		COLLAPSED
		<BODY>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../ann/annotation.tpl'
			</TEMPLATE_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s2';
				}
				<AREA>
					<CTRL_GROUP>
						FMT={
							trow.bkgr.color='#CCCCFF';
						}
						<CTRLS>
							<TEXT_CTRL>
								TEXT='Annotation'
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<FOLDER>
		DESCR='XML SOURCE'
		COND='getBooleanParam("doc.xsd.comp.xml")'
		COLLAPSED
		<HTARGET>
			HKEYS={
				'contextElement.id';
				'"xml-source"';
			}
			NAME_EXPR='output.type == "document" ? "xml_source" : ""'
		</HTARGET>
		<BODY>
			<AREA_SEC>
				COND='getBooleanParam("doc.xsd.comp.xml.box")'
				BREAK_PARENT_BLOCK='when-executed'
				FMT={
					sec.outputStyle='table';
					table.sizing='Relative';
					table.autofit='false';
					table.cell.padding.both='3.3';
					table.bkgr.color='#F5F5F5';
					table.border.style='solid';
					table.border.color='#999999';
					table.option.borderStylesInHTML='true';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<TEMPLATE_CALL_CTRL>
								TEMPLATE_FILE='../../xml/nodeSource.tpl'
								PASSED_PARAMS={
									'$remove.xsd.anns','getBooleanParam("doc.xsd.comp.xml.remove.xsd.anns")';
								}
								FMT={
									ctrl.size.width='499.5';
									ctrl.size.height='17.3';
								}
							</TEMPLATE_CALL_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
			<TEMPLATE_CALL>
				TEMPLATE_FILE='../../xml/nodeSource.tpl'
				PASSED_PARAMS={
					'$remove.xsd.anns','getBooleanParam("doc.xsd.comp.xml.remove.xsd.anns")';
				}
			</TEMPLATE_CALL>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					sec.outputStyle='table';
					table.sizing='Relative';
				}
				<AREA>
					<SPACER>
						FMT={
							spacer.height='10';
						}
					</SPACER>
					<CTRL_GROUP>
						<CTRLS>
							<PANEL>
								FMT={
									ctrl.size.width='499.5';
									ctrl.size.height='41.3';
									tcell.bkgr.color='#CCCCFF';
									par.style='s1';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<TEXT_CTRL>
												TEXT='XML Source'
											</TEXT_CTRL>
											<DELIMITER>
												FMT={
													text.style='cs1';
												}
											</DELIMITER>
											<TEMPLATE_CALL_CTRL>
												TEMPLATE_FILE='../../xml/sourceNote.tpl'
												PASSED_PARAMS={
													'$remove.xsd.anns','getBooleanParam("doc.xsd.comp.xml.remove.xsd.anns")';
												}
												FMT={
													text.style='cs4';
												}
											</TEMPLATE_CALL_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
						</CTRLS>
					</CTRL_GROUP>
					<SPACER>
						FMT={
							spacer.height='8.3';
						}
					</SPACER>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<TEMPLATE_CALL>
		DESCR='CONTENT ELEMENT DETAIL'
		COND='getBooleanParam("doc.xsd.comp.contentElements") &&
getBooleanParam("doc.xsd.comp.contentElements.for.group")'
		TEMPLATE_FILE='../element/contentElements.tpl'
	</TEMPLATE_CALL>
	<TEMPLATE_CALL>
		DESCR='Bottom Message'
		COND='output.type == "document" && getBooleanParam("show.about")'
		TEMPLATE_FILE='../../about.tpl'
	</TEMPLATE_CALL>
</ROOT>
<STOCK_SECTIONS>
	<TEMPLATE_CALL>
		SS_NAME='Component Name'
		DESCR='prints the qualified name of any global schema component or local element (passed as the stock-section context element)'
		TEMPLATE_FILE='../component/componentName.tpl'
		PASSED_PARAMS={
			'$xmlContexts','Array (rootElement, contextElement)';
		}
		FMT={
			sec.outputStyle='text-par';
		}
	</TEMPLATE_CALL>
	<TEMPLATE_CALL>
		SS_NAME='localElementExt'
		MATCHING_ET='xs:%localElement'
		TEMPLATE_FILE='../element/localElementExt.tpl'
		PASSED_PARAMS={
			'$xmlContexts','Array (rootElement, contextElement)';
		}
		PASSED_ROOT_ELEMENT_EXPR='// the element passed to localElementExt.tpl template 
// must be either globaly documented directly (not via a unifier)
// or not globally documented at all

el = findElementByKey (
  "xsd-globally-documented-local-elements",
  contextElement.id
);

el != null ? el : contextElement'
	</TEMPLATE_CALL>
	<AREA_SEC>
		SS_NAME='redefinition'
		FMT={
			sec.outputStyle='text-par';
		}
		<AREA>
			<CTRL_GROUP>
				<CTRLS>
					<TEXT_CTRL>
						TEXT='(redefinition'
					</TEXT_CTRL>
					<DATA_CTRL>
						COND='getServiceAttr("redefinition").toInt() > 0'
						FORMULA='getServiceAttr ("redefinition")'
					</DATA_CTRL>
					<DELIMITER>
						FMT={
							txtfl.delimiter.type='none';
						}
					</DELIMITER>
					<TEXT_CTRL>
						TEXT=')'
					</TEXT_CTRL>
				</CTRLS>
			</CTRL_GROUP>
		</AREA>
	</AREA_SEC>
	<FOLDER>
		SS_NAME='Usage Location List'
		DESCR='params[0]: list title; 
params[1]: list layout;
params[2]: vector of usage locations (components) to list'
		<BODY>
			<ELEMENT_ITER>
				DESCR='print the list as comma-delimited text flow'
				COND='stockSection.params[1] == "flow"
||
stockSection.params[1] == "optimal"
||
stockSection.params[2].toVector().size() == 1'
				BREAK_PARENT_BLOCK='when-executed'
				TARGET_ET='<ANY>'
				SCOPE='custom'
				ELEMENT_ENUM_EXPR='stockSection.params[2].toEnum()'
				FMT={
					sec.outputStyle='list';
					list.type='delimited';
				}
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								FMT={
									txtfl.delimiter.type='nbsp';
								}
								<CTRLS>
									<SS_CALL_CTRL>
										SS_NAME='Component Name'
									</SS_CALL_CTRL>
									<PANEL>
										COND='output.format.supportsPageRefs
&&
getBooleanParam("fmt.page.refs")
&&
findHyperTarget (Array (
  contextElement.id,
  Array ("detail", "xml-source-location")
)) != null'
										FMT={
											ctrl.size.width='159.8';
											text.style='cs6';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<TEXT_CTRL>
														TEXT='['
													</TEXT_CTRL>
													<DATA_CTRL>
														DOCFIELD='page-htarget'
														FMT={
															ctrl.option.noHLinkFmt='true';
															text.hlink.fmt='none';
														}
														<DOC_HLINK>
															HKEYS={
																'contextElement.id';
																'Array ("detail", "xml-source-location")';
															}
														</DOC_HLINK>
													</DATA_CTRL>
													<TEXT_CTRL>
														TEXT=']'
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</ELEMENT_ITER>
			<ELEMENT_ITER>
				DESCR='print one-column list'
				COND='stockSection.params[1] == "one_column"'
				BREAK_PARENT_BLOCK='when-executed'
				TARGET_ET='<ANY>'
				SCOPE='custom'
				ELEMENT_ENUM_EXPR='stockSection.params[2].toEnum()'
				FMT={
					list.type='delimited';
				}
				<BODY>
					<AREA_SEC>
						<AREA>
							<CTRL_GROUP>
								<CTRLS>
									<SS_CALL_CTRL>
										SS_NAME='Component Name'
									</SS_CALL_CTRL>
									<PANEL>
										COND='output.format.supportsPageRefs
&&
getBooleanParam("fmt.page.refs")
&&
findHyperTarget (Array (
  contextElement.id,
  Array ("detail", "xml-source-location")
)) != null'
										FMT={
											ctrl.size.width='159.8';
											text.style='cs6';
											txtfl.delimiter.type='none';
										}
										<AREA>
											<CTRL_GROUP>
												<CTRLS>
													<TEXT_CTRL>
														TEXT='['
													</TEXT_CTRL>
													<DATA_CTRL>
														DOCFIELD='page-htarget'
														FMT={
															ctrl.option.noHLinkFmt='true';
															text.hlink.fmt='none';
														}
														<DOC_HLINK>
															HKEYS={
																'contextElement.id';
																'Array ("detail", "xml-source-location")';
															}
														</DOC_HLINK>
													</DATA_CTRL>
													<TEXT_CTRL>
														TEXT=']'
													</TEXT_CTRL>
												</CTRLS>
											</CTRL_GROUP>
										</AREA>
									</PANEL>
									<DELIMITER>
										FMT={
											txtfl.delimiter.type='none';
										}
									</DELIMITER>
									<TEXT_CTRL>
										COND='! iterator.isLastItem'
										TEXT=','
									</TEXT_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</ELEMENT_ITER>
			<FOLDER>
				DESCR='otherwise, print two-column list'
				<BODY>
					<AREA_SEC>
						FMT={
							sec.outputStyle='table';
							table.cell.padding.both='0';
							table.border.style='none';
						}
						<AREA>
							<CTRL_GROUP>
								FMT={
									trow.cell.align.vert='Top';
								}
								<CTRLS>
									<SS_CALL_CTRL>
										SS_NAME='Usage Location List Column'
										PARAMS_EXPR='v = stockSection.params[2].toVector();
N = v.size();

Array (
  v.subVector (0, (N + 1) / 2),
  N == 1
)'
										FMT={
											ctrl.size.width='216';
											ctrl.size.height='17.3';
										}
									</SS_CALL_CTRL>
									<SS_CALL_CTRL>
										SS_NAME='Usage Location List Column'
										PARAMS_EXPR='v = stockSection.params[2].toVector();

Array (
  v.subVector ((v.size() + 1) / 2),
  true
)'
										FMT={
											ctrl.size.width='283.5';
											ctrl.size.height='17.3';
											tcell.padding.extra.left='10';
										}
									</SS_CALL_CTRL>
								</CTRLS>
							</CTRL_GROUP>
						</AREA>
					</AREA_SEC>
				</BODY>
			</FOLDER>
		</BODY>
		<HEADER>
			<AREA_SEC>
				FMT={
					par.style='s3';
				}
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<DATA_CTRL>
								FORMULA='stockSection.param'
							</DATA_CTRL>
							<DATA_CTRL>
								FORMULA='"(" + stockSection.params[2].toVector().size() + ")"'
							</DATA_CTRL>
							<DELIMITER>
								FMT={
									txtfl.delimiter.type='none';
								}
							</DELIMITER>
							<TEXT_CTRL>
								TEXT=':'
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</HEADER>
	</FOLDER>
	<ELEMENT_ITER>
		SS_NAME='Usage Location List Column'
		DESCR='params[0]: vector of components; 
params[1]: true if this is the last part of the whole list (to avoid printing comma after last item)'
		TARGET_ET='<ANY>'
		SCOPE='custom'
		ELEMENT_ENUM_EXPR='toEnum (stockSection.param)'
		FMT={
			sec.outputStyle='pars';
			par.option.nowrap='true';
			list.style.type='none';
		}
		<BODY>
			<AREA_SEC>
				<AREA>
					<CTRL_GROUP>
						<CTRLS>
							<SS_CALL_CTRL>
								SS_NAME='Component Name'
							</SS_CALL_CTRL>
							<PANEL>
								COND='output.format.supportsPageRefs
&&
getBooleanParam("fmt.page.refs")
&&
findHyperTarget (Array (
  contextElement.id,
  Array ("detail", "def", "xml-source-location")
)) != null'
								FMT={
									ctrl.size.width='156';
									text.style='cs6';
									txtfl.delimiter.type='none';
								}
								<AREA>
									<CTRL_GROUP>
										<CTRLS>
											<TEXT_CTRL>
												TEXT='['
											</TEXT_CTRL>
											<DATA_CTRL>
												DOCFIELD='page-htarget'
												FMT={
													ctrl.option.noHLinkFmt='true';
													text.hlink.fmt='none';
												}
												<DOC_HLINK>
													HKEYS={
														'contextElement.id';
														'Array ("detail", "def", "xml-source-location")';
													}
												</DOC_HLINK>
											</DATA_CTRL>
											<TEXT_CTRL>
												TEXT=']'
											</TEXT_CTRL>
										</CTRLS>
									</CTRL_GROUP>
								</AREA>
							</PANEL>
							<DELIMITER>
								FMT={
									txtfl.delimiter.type='none';
								}
							</DELIMITER>
							<TEXT_CTRL>
								COND='! iterator.isLastItem ||
! stockSection.params[1].toBoolean()'
								TEXT=','
							</TEXT_CTRL>
						</CTRLS>
					</CTRL_GROUP>
				</AREA>
			</AREA_SEC>
		</BODY>
	</ELEMENT_ITER>
</STOCK_SECTIONS>
CHECKSUM='d?KjYC8gj5aUZpVSP8P?hNKLsFxOaOY3wFym6Pg9nrU'
</DOCFLEX_TEMPLATE>