@echo off

if "%1" == "" goto USAGE
if "%2" == "" goto USAGE

cls

set HOME=c:\OpenSSL-Win64\bin\

if not exist "%HOME%" goto ERROR_OPENSSL



set START_DIR=%CD%

cd %HOME%

if not exist "openssl.cfg" goto ERROR_OPENSSL

cd %START_DIR%

cls


if not exist "%1" goto ERROR_FILE
if not exist "%2" goto ERROR_FILE

openssl x509 -x509toreq -in %1 -out req.pem -signkey %2



echo Zakonczono generowanie prosby o wznowienie certyfikatu. 
echo Plik req.pem musisz wyslac mailem jako zalacznik do administratora w celu podpisania na adres ca@cis.gov.pl

goto END

:USAGE
echo Jako pierwszy parametr podaj swoj certyfikat w formacie PEM, jako drugi parametr podaj swoj klucz w formacie PEM.
goto END

:ERROR_FILE
echo Wystalpil blad podczas generowania prosby. Skontaktuj sie z administratorem.
goto END

:ERROR_OPENSSL
echo Nie znaleziono katalogu:
echo %HOME%
echo Upewnij, siê czy zainstales pakiet OpenSSL z domyslnymi ustawieniami.
goto END

:ERROR_OPENSSL
echo Nie znaleziono domyslnego pliku konfiguracyjnego OpenSSL
echo %HOME%\openssl.cnf.sample
echo Upewnij, siê czy zainstales pakiet OpenSSL z domyslnymi ustawieniami.
goto END

:END
