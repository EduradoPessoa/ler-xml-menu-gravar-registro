#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

/*/{Protheus.doc} LeMenu
Lê o menu (*.xnu) do Protheus e grava em uma tabela.
@type function
@version  0.1
@author eduardo.pessoa
@since 20/06/2021
/*/
User Function LerMenu()
    Local aFiles := {}
    Local nX
    local nCount
    aFiles := Directory("\system\*.XNU", "D")
    nCount := Len( aFiles )
    For nX := 1 to nCount
        ConOut('Arquivo: ' + aFiles[nX,1] + ' - Size: ' + AllTrim(Str(aFiles[nX,2])) )
        lerXml(aFiles[nX,1])
    Next nX
Return

/*/{Protheus.doc} LerXml
Ler as linas do XML do menu, arquivo a arquivo.
@type function
@author eduardo.pessoa
@since 20/06/2021
/*/
Static Function LerXml(cFileName)
    LOCAL nBloco := 128
    LOCAL cBuffer := SPACE(512)
    LOCAL cArq     := FOPEN(cFileName)     // Opens the binary file.
    LOCAL nBytes := 0

    IF FERROR() <> 0
        MsgAlert("Error when accessing file no. " + STR(FERROR()))
        RETURN
    ELSE
        nBytes := FREAD(cArq, @cBuffer, nBloco)      // Reads the bytes.
        IF nBytes <> nBloco
            MsgAlert("Reading error no. " + STR(FERROR()))
            RETURN
        ELSE
            MsgAlert(nBytes)     // Displays the read bytes.
        ENDIF
ENDIF
Return
