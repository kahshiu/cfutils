
<cfset envs = {}>
<cfset envs.dev = "claims_dev">
<cfset envs.prodmy = "my_claims_prod_stage">

<cfset source = envs.dev>
<cfset target = envs.prodmy>

                                  
<cfset writeProcToCompare2DB("25886_bi","sspTRXClaimantGetList",envs.dev,envs.prodmy)>
<cfset writeProcToCompare2DB("25886_bi","sspDETInjuryCreateEdit2",envs.dev,envs.prodmy)>
<cfset writeProcToCompare2DB("25886_bi","sspPDBCaseCat",envs.dev,envs.prodmy)>
<cfset writeProcToCompare2DB("25886_bi","sspDETInjuryCopy",envs.dev,envs.prodmy)>


<!--- 
<cffunction access="public" name="writeProcCombined" returntype="string" output=false description="">
    <cfargument name="filepaths" type="array" required="true">
    <cfset target = dateformat(now(),"yyyy-mm-dd.hh-nn-ss")>
    <cffile action = "append" file = "\temp\foo" attributes = normal output = "Is this a test?">
</cffunction>
 --->


<cffunction access="public" name="writeProcToCompare2DB" returntype="string" output=false description="">
    <cfargument name="taskname" type="string" required="true">
    <cfargument name="ssp" type="string" required="true">
    <cfargument name="db1" type="string" required="true">
    <cfargument name="db2" type="string" required="true">
    <cfset writeProcToCompare(arguments.taskname,arguments.ssp,arguments.db1)>
    <cfset writeProcToCompare(arguments.taskname,arguments.ssp,arguments.db2)>
</cffunction>

<cffunction access="public" name="writeProcToCompare" returntype="void" output=false description="">
    <cfargument name="taskname" type="string" required="true">
    <cfargument name="ssp" type="string" required="true">
    <cfargument name="db" type="string" required="true">

    <cfset var targetDirectory = "./compare_#taskname#">
    <cfset padDirectory(expandPath(targetDirectory))>

    <cfset var textbody = getProcedure(arguments.db,arguments.ssp)>
    <cfset var targetFilePath = expandPath("#targetDirectory#/#arguments.ssp#.#arguments.db#.ssp")>

    <cfif textbody neq "">
        <cfset filewrite(targetFilePath,textbody)>
    </cfif>
</cffunction>

<cffunction access="public" name="writeProcToFolderDB" returntype="void" output=false description="">
    <cfargument name="db" type="string" required="true">
    <cfargument name="ssp" type="string" required="true">

    <cfset var targetDirectory = "./db_#arguments.db#">
    <cfset padDirectory(expandPath(targetDirectory))>

    <cfset var textbody = getProcedure(arguments.db,arguments.ssp)>
    <cfset var targetFilePath = expandPath("#targetDirectory#/#arguments.ssp#.ssp")>

    <cfif textbody neq "">
        <cfset filewrite(targetFilePath,textbody)>
    </cfif>
</cffunction>

<cffunction access="public" name="padDirectory" returntype="void" output=false description="">
    <cfargument name="targetDir" type="string" required="true">
    <cfif not directoryExists(arguments.targetDir)>
        <cfset directoryCreate(arguments.targetDir)>
    </cfif>
</cffunction>

<cffunction access="public" name="getProcedure" returntype="string" output=false description="">
    <cfargument name="db" type="string" required="true">
    <cfargument name="ssp" type="string" required="true">
    <cfquery name="qry_p" datasource="#arguments.db#">
        select object_definition( object_id(
            <cfqueryparam value=#arguments.ssp# CFSQLType="cf_sql_varchar" null="no">
        )) as textbody
    </cfquery>
    <cfreturn qry_p.textbody>
</cffunction>
<!--- 
<cffunction access="public" name="getProc" returntype="string" output=false description="">
    <cfargument name="db" type="string" required="true">
    <cfargument name="objtype" type="string" required="true">

    <cfset var types = {}>
    <cfset types.SSP = "P">
    <cfset types.FN  = "FN,FN,TF,IF"> 

<cfset item
    <cfquery name="qry_source" datasource="#arguments.db#">
        select object_id()
        SELECT
            O.name as objname
            ,case 
                when O.type in (<cfqueryparam value="#types.ssp#" CFSQLType = "cf_sql_varchar" null="no" list="yes" separator=",">) then 'SSP'
                when O.type in (<cfqueryparam value="#types.FN#" CFSQLType = "cf_sql_varchar" null="no" list="yes" separator=",">) then 'FN'
             end as objtype
            ,OBJECT_DEFINITION( OBJECT_ID(R.ROUTINE_NAME) ) as objdef 
        FROM 
            sys.objects O 
            LEFT JOIN sys.extended_properties E ON E.major_id = O.object_id
            INNER JOIN INFORMATION_SCHEMA.ROUTINES R ON R.ROUTINE_NAME = O.name
        WHERE 
            ISNULL(E.name, '') <> 'microsoft_database_tools_support'
            AND ISNULL(O.is_ms_shipped,0) = 0

            <cfif len(myObjTypes) gt 0>
                AND O.type in ( <cfqueryparam value="#myObjTypes#" CFSQLType = "cf_sql_varchar" null="no" list="yes" separator=",">)
            </cfif>

            <cfif len(arguments.objnames) gt 0>
                AND O.name in ( <cfqueryparam value=#arguments.objnames# CFSQLType="cf_sql_varchar" null="no" list="yes" separator=","> )
            </cfif>
        ORDER BY O.type, O.name        
    </cfquery>
<cfif structKeyExists(types,arguments.objtype)>
</cfif>
</cffunction>
 --->
