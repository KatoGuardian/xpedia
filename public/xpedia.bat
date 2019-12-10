@echo off
setlocal
CHCP 65001 >NUL

set mod_name=Piratez
set language_name=en-US
set language_name0=ruleset
set language_name1=ru
set language_name2=pl
set language_name3=cs
set language_name4=es-ES

set mod_rules_path=user\mods\%mod_name%\Ruleset
set mod_language_path=user\mods\%mod_name%\Language\%language_name%.yml
set mod_language_path1=user\mods\%mod_name%\Language\%language_name1%.yml
set mod_language_path2=user\mods\%mod_name%\Language\%language_name2%.yml
set mod_language_path3=user\mods\%mod_name%\Language\%language_name3%.yml
set mod_language_path4=user\mods\%mod_name%\Language\%language_name4%.yml
set vanilla_rules_path=standard\xcom1
set vanilla_language_path=standard\xcom1\Language\%language_name%.yml
set vanilla_language_path1=standard\xcom1\Language\%language_name1%.yml
set vanilla_language_path2=standard\xcom1\Language\%language_name2%.yml
set vanilla_language_path3=standard\xcom1\Language\%language_name3%.yml
set vanilla_language_path4=standard\xcom1\Language\%language_name4%.yml
rem set xpedia_language_path=xpedia\Language\%language_name%.yml
set xpedia_language_path=xpedia\Language\%language_name%.yml
set xpedia_language_path1=xpedia\Language\%language_name1%.yml
set xpedia_language_path2=xpedia\Language\%language_name2%.yml
set xpedia_language_path3=xpedia\Language\%language_name3%.yml
set xpedia_language_path4=xpedia\Language\%language_name4%.yml
set pedia_header=xpedia\xpedia.html.header

>xpedia_en-US.html (
	type %pedia_header%
	
	echo FILE: xpedia
	echo {modName: %mod_name%}

	for /r %vanilla_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	for /r %mod_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	echo FILE: Language
	
	echo | set /p langTag=langv-
	type "%vanilla_language_path%"
	
	echo | set /p langTag=langm-
	type "%mod_language_path%"

	echo | set /p langTag=langp-
	type "%xpedia_language_path%"	
)

index.html

>xpedia_ruleset.html (
	type %pedia_header%
	
	echo FILE: xpedia
	echo {modName: %mod_name%}

	for /r %vanilla_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	for /r %mod_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)

)

>xpedia_ru.html (
	type %pedia_header%
	
	echo FILE: xpedia
	echo {modName: %mod_name%}

	for /r %vanilla_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	for /r %mod_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	echo FILE: Language
	
	echo | set /p langTag=langv-
	type "%vanilla_language_path1%"
	
	echo | set /p langTag=langm-
	type "%mod_language_path1%"

	echo | set /p langTag=langp-
	type "%xpedia_language_path1%"	

)


>xpedia_pl.html (
	type %pedia_header%
	
	echo FILE: xpedia
	echo {modName: %mod_name%}

	for /r %vanilla_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	for /r %mod_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	echo FILE: Language
	
	echo | set /p langTag=langv-
	type "%vanilla_language_path2%"
	
	echo | set /p langTag=langm-
	type "%mod_language_path2%"

	echo | set /p langTag=langp-
	type "%xpedia_language_path2%"		

)

>xpedia_cs.html (
	type %pedia_header%
	
	echo FILE: xpedia
	echo {modName: %mod_name%}

	for /r %vanilla_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	for /r %mod_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	echo FILE: Language
	
	echo | set /p langTag=langv-
	type "%vanilla_language_path3%"
	
	echo | set /p langTag=langm-
	type "%mod_language_path3%"

	echo | set /p langTag=langp-
	type "%xpedia_language_path3%"		

)

>xpedia_es-ES.html (
	type %pedia_header%
	
	echo FILE: xpedia
	echo {modName: %mod_name%}

	for /r %vanilla_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	for /r %mod_rules_path% %%F in (*.rul) do (
		echo FILE: %%F
		type "%%F"
		echo.
	)
	
	echo FILE: Language
	
	echo | set /p langTag=langv-
	type "%vanilla_language_path4%"
	
	echo | set /p langTag=langm-
	type "%mod_language_path4%"

	echo | set /p langTag=langp-
	type "%xpedia_language_path4%"		

)
