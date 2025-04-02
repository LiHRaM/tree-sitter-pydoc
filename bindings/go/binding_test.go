package tree_sitter_pydoc_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_pydoc "github.com/lihram/tree-sitter-pydoc/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_pydoc.Language())
	if language == nil {
		t.Errorf("Error loading Pydoc grammar")
	}
}
