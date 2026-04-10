# README

## Realce de sintaxe e snippets para FoxPro (VFP) no VS Code / Cursor

Esta extensão adiciona realce de sintaxe genérico para FoxPro (incluindo detecção de definições de função e classe).

![captura de tela](screenshot.png "captura de tela")

### Como instalar

A forma mais simples é usar a barra lateral de extensões, pesquisar por «foxpro» e clicar em **Instalar**. Para instalar a partir de um ficheiro VSIX, siga: [Instalar a partir de um VSIX](https://code.visualstudio.com/docs/editor/extension-gallery#_install-from-a-vsix).

### Snippets

- *lnsel*: `SELECT` local (declara uma variável, guarda a área atual e restaura ao sair)
- *docase*: `DO CASE` (vários `CASE` e `OTHER`)
- *prc*: declaração `PROCEDURE`
- *dc*: `DEFINE CLASS` (sem referência a ficheiro externo)
- *dco*: `DEFINE CLASS` (com referência a ficheiro externo `.fxp`)
- *dcf*: `DEFINE CLASS` com instanciação direta (por exemplo `xxx = NomeDoArquivoObjeto()` para obter uma instância)
- *ifel*: `IF` / `ELSE` / `ENDIF`
- *ifend*: `IF` / `ENDIF`
- *iifs*: `IIF` simples
- *ics*: `ICASE` simples
- *tryc*: bloco `TRY` / `CATCH`
- *tryf*: bloco `TRY` / `CATCH` / `FINALLY`
- *adp*: chamada `ADDPROPERTY`
- *eo*: instanciação de objeto `EMPTY`
- *newo*: chamada `NEWOBJECT`
- *fore*: laço `FOR` … `ENDFOR`
- *foralines*: usa `ALINES` para partir uma string e percorrer cada linha com `FOR` … `ENDFOR`
- *bnd*: chamada `BINDEVENT`

### Créditos

Inspiração da extensão (e ficheiro de realce de sintaxe): [Matt Slay — modelo de linguagem VFP para VS Code](https://github.com/mattslay/Visual-FoxPro-language-template-for-Visual-Studio-Code)

Ícone da raposa: [Freepik](https://www.freepik.com/), licença Creative Commons

<details>
  <summary>Lista de snippets internos — referem bibliotecas internas; pouco úteis fora desse contexto</summary>
  <ul>
<li> *fs* (select), *fso* (select para objeto), *fin* (insert), *fup* (update), *fdel* (delete)
<li> *multi* — declaração multiprompt baseada em `TEXT … ENDTEXT`
<li> *mptext*, *mpname*, *mpnum*, *mpdate*, *mplist*, *mpcheck*, *mplabel*, *mprange*, *mpnote*
<li> *dopen* (`this.Open`), *popen* (`this.Dao.Open`)
<li> *dw* (`.Where`), *dwcomplete* (`.Where` completo)
<li> *djoin* (`.Join`), *dfields* (`.Fields`), *dset* (`.Set`), *dsetobject* (`.SetObject`)
<li> *dinvalue* (`.IntoValue`), *dinobject* (`.IntoObject`), *dincursor* (`.IntoCursor`)
  </ul>
</details>
