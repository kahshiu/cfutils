<cfset files = 
["c:/inetpub2/claims/other/dsp_othinvoice.cfm"
,"c:/inetpub2/claims/other/dsp_othinvoice.cfm"
,"c:/inetpub2/claims/Secured/TEMPLATE/7792/othinvoice.cfm"
,"c:/inetpub2/claims/Secured/TEMPLATE/othInvoice.cfm"
,"c:/inetpub2/claims/CustomTags/MTRcffunctions.cfm"
,"c:/inetpub2/claims/other/dsp_othinvoice.cfm"
,"c:/inetpub2/claims/other/dsp_othinvoice.cfm"
,"c:/inetpub2/claims/adjuster/act_adjinvoice.cfm"
,"c:/inetpub2/claims/adjuster/dsp_adjinvoice.cfm"
,"c:/inetpub2/claims/MSupport/unencoded/mes.js"
,"c:/inetpub2/claims/est/act_estdtls.cfm"
,"c:/inetpub2/claims/est/dsp_estGSTlogic.cfm"
,"c:/inetpub2/claims/est/dsp_estdtls.cfm"
,"c:/inetpub2/claims/est/dsp_totsummary.cfm"
,"c:/inetpub2/claims/est/estinterface/dsp_details.cfm"
,"c:/inetpub2/claims/est/index.cfc"
,"c:/inetpub2/claims/insurer/dsp_insofferinfoM.cfm"
,"c:/inetpub2/claims/Secured/TEMPLATE/RepInvoice.cfm"
,"c:/inetpub2/claims/CustomTags/MTRcffunctions.cfm"
,"c:/inetpub2/claims/repairer/act_attachbill.cfm"
,"c:/inetpub2/claims/repairer/dsp_attachbill.cfm"
,"c:/inetpub2/claims/admin/act_coprofile.cfm"
,"c:/inetpub2/claims/admin/dsp_coprofile.cfm"
,"c:/inetpub2/claims/est/dsp_estGSTlogic.cfm"
,"c:/inetpub2/claims/est/dsp_estdtls.cfm"
,"c:/inetpub2/claims/admin/act_csaction.cfm"
,"c:/inetpub2/claims/admin/dsp_csclmdtls.cfm"
,"c:/inetpub2/claims/adjuster/dsp_adjinvoice.cfm"
,"c:/inetpub2/claims/est/dsp_estdtls.cfm"
,"c:/inetpub2/claims/est/dsp_estdtls_novech.cfm"
,"c:/inetpub2/claims/insurer/dsp_insofferinfo.cfm"
,"c:/inetpub2/claims/insurer/dsp_insofferinfoNM.cfm"
,"c:/inetpub2/claims/adjuster/dsp_adjinvoice.cfm"
,"c:/inetpub2/claims/other/dsp_othinvoice.cfm"
,"c:/inetpub2/claims/adjuster/dsp_adjinp.cfm"
,"c:/inetpub2/claims/adjuster/dsp_adjsubcase.cfm"
,"c:/inetpub2/claims/adjuster/dsp_rpts.cfm"
,"c:/inetpub2/claims/adjuster/dsp_showsubmitrpt.cfm"
,"c:/inetpub2/claims/repairer/act_repofrdec.cfm"
,"c:/inetpub2/claims/est/dsp_totsummary.cfm"
,"c:/inetpub2/claims/adjuster/act_adjsubcase.cfm"
,"c:/inetpub2/claims/adjuster/dsp_adjsubcase.cfm"
,"c:/inetpub2/claims/est/dsp_estdtls.cfm"
,"c:/inetpub2/claims/insurer/dsp_insclmrefdtl.cfm"
,"c:/inetpub2/claims/insurer/dsp_inspostauth.cfm"
,"c:/inetpub2/claims/insurer/dsp_inssubcase.cfm"
,"c:/inetpub2/claims/insurer/dsp_showrpt.cfm"
,"c:/inetpub2/claims/other/act_othinvoicelist.cfm"
,"c:/inetpub2/claims/other/dsp_genothinvoice.cfm"
,"c:/inetpub2/claims/repairer/act_attachbill.cfm"
]>
<cfset companionMob = []>
<cfloop array=#files# index="item">
    <cfset temp = listToArray(item,".")>
    <cfset temp2 = [temp[1],"_mob","."&temp[2]]>
    <cfset companionFile = arrayToList(temp2,"")>
    <cfif fileExists(companionFile)>
        <cfset arrayAppend(companionMob,companionFile)>
    </cfif>
</cfloop>
<cfdump var=#companionMob#>
<cfabort>
