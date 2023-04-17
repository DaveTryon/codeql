import javascript

module Standards {
  // Helper function to get a normalized value from an attribute
  string getAttributeValue(DOM::AttributeDefinition attribute) {
    result = attribute.getValueNode().toString().trim().toLowerCase().replaceAll("\"", "")
  }

  // Helper function to get a normalized value from an element and a role value
  bindingset[attributeName]
  string getElementAttributeValue(DOM::ElementDefinition element, string attributeName) {
    result = getAttributeValue(element.getAttributeByName(attributeName))
  }

  // All defined roles
  predicate ariaRoles(string s) {
    s in [
      "alert", "alertdialog", "application", "article", "banner", "blockquote", "button",
      "caption", "cell", "checkbox", "code", "columnheader", "combobox", "command", "comment",
      "complementary", "composite", "contentinfo", "definition", "deletion", "dialog",
      "directory", // deprecated in Aria 1.2 proposal
      "document", "emphasis", "feed", "figure", "form", "grid", "gridcell", "group", "heading",
      "img", "input", "insertion", "landmark", "link", "list", "listbox", "listitem", "log",
      "main", "marquee", "math", "menu", "menubar", "menuitem", "menuitemcheckbox",
      "menuitemradio", "meter", "mark", "navigation", "none", "note", "option",
      "paragraph", "presentation", "progressbar", "radio", "radiogroup", "range", "region",
      "roletype", "row", "rowgroup", "rowheader", "scrollbar", "search", "searchbox", "section",
      "sectionhead", "select", "separator", "slider", "spinbutton", "strong", "structure",
      "subscript", "superscript", "switch", "suggestion", "tab", "table", "tablist", "tabpanel",
      "term", "text", "textbox", "time", "timer", "toolbar", "tooltip", "tree", "treegrid", "treeitem",
      "widget", "window",
    ]
  }
  
  // Class to expose functionality based on role
  class DefinedRole extends string {
    DefinedRole() {
      ariaRoles(this)
    }
  
    boolean isDeprecatedRole() {
      // For now, no roles are deprecated. Add them with an if statement, as commented out below
      // if this = "deprecrated_role" then result = true else
      result = false
    }
  
    boolean isSupportedRole(DOM::AttributeDefinition role) {
      // FUTURE: Support cases there the attribute specifies multiple roles in a space-delimited collection
  
      if (
        getAttributeValue(role) = this.toString()
        and 
        this.isDeprecatedRole() = false
      )
      then result = true
      else result = false
    }
  
    string getRequiredAttributes() {
      if this = "checkbox" then result = ["aria-checked"]
      else if this = "combobox" then result = ["aria-expanded", "aria-controls"]
      else if this = "heading" then result = ["aria-level"]
      else if this = "menuitemcheckbox" then result = ["aria-checked"]
      else if this = "menuitemradio" then result = ["aria-checked"]
      else if this = "meter" then result = ["aria-valuenow"]
      else if this = "widget" then result = ["aria-checked"]
      else if this = "scrollbar" then result = ["aria-valuenow"]
      else if this = "separator" then result = ["aria-valuenow"]
      else if this = "slider" then result = ["aria-valuenow"]
      else if this = "switch" then result = ["aria-checked"]
      else result = [""]
    }
  }
}
  