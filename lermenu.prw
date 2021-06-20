#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

/*/{Protheus.doc} LeMenu
Lê o menu (*.xnu) do Protheus e grava em uma tabela.
@type function
@version  0.1
@author eduardo.pessoa
@since 20/06/2021
@return return_type, return_description
/*/
User Function LerMenu()
  Local aFiles := {}
  Local nX
  local nCount
  aFiles := Directory("\system\*.XNU", "D")
  nCount := Len( aFiles )
  For nX := 1 to nCount
      ConOut('Arquivo: ' + aFiles[nX,1] + ' - Size: ' + AllTrim(Str(aFiles[nX,2])) )
  Next nX
Return
