---@type vim.lsp.Config
return {
  settings = {
    ty = {
      diagnosticMode = "off",
    },
  },
  on_init = function(client)
    local capabilities = assert(client.server_capabilities)
    -- capabilities.completionProvider = nil
    -- capabilities.hoverProvider = nil
    capabilities.inlayHintProvider = nil
    -- capabilities.inlineCompletionProvider = nil
    -- capabilities.callHierarchyProvider = nil
    -- capabilities.codeActionProvider = nil
    -- capabilities.codeLensProvider = nil
    -- capabilities.colorProvider = nil
    -- capabilities.declarationProvider = nil
    -- capabilities.definitionProvider = nil
    capabilities.diagnosticProvider = nil
    -- capabilities.documentFormattingProvider = nil
    -- capabilities.documentHighlightProvider = nil
    -- capabilities.documentLinkProvider = nil
    -- capabilities.documentOnTypeFormattingProvider = nil
    -- capabilities.documentRangeFormattingProvider = nil
    -- capabilities.documentSymbolProvider = nil
    -- capabilities.executeCommandProvider = nil
    -- capabilities.experimental = nil
    -- capabilities.foldingRangeProvider = nil
    -- capabilities.implementationProvider = nil
    -- capabilities.inlineValueProvider = nil
    -- capabilities.linkedEditingRangeProvider = nil
    -- capabilities.monikerProvider = nil
    -- capabilities.notebookDocumentSync = nil
    capabilities.referencesProvider = nil
    -- capabilities.renameProvider = nil
    -- capabilities.selectionRangeProvider = nil
    -- capabilities.semanticTokensProvider = nil
    -- capabilities.signatureHelpProvider = nil
    -- capabilities.typeDefinitionProvider = nil
    -- capabilities.typeHierarchyProvider = nil
    -- capabilities.workspaceSymbolProvider = nil
  end,
}
