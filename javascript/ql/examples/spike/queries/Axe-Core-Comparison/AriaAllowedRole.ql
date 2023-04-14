/*
 * @name Aria Allowed Role
 * @description Fail if a DOMElement's defined role is not allowed or unsupported
 */

import javascript

bindingset[input]
string unquotedString(string input){
  result = input.replaceAll("\"", "")
}

class DefinedRole extends string {
  DefinedRole() {
    this = "alert" or
    this = "alertdialog" or
    this = "application" or
    this = "article" or
    this = "banner" or
    this = "blockquote" or
    this = "button" or
    this = "caption" or
    this = "cell" or
    this = "checkbox" or
    this = "code" or
    this = "columnheader" or
    this = "combobox" or
    this = "command" or
    this = "comment" or
    this = "complementary" or
    this = "composite" or
    this = "contentinfo" or
    this = "definition" or
    this = "deletion" or
    this = "dialog" or
    this = "directory" or   // deprecated in Aria 1.2 proposal
    this = "document" or
    this = "emphasis" or
    this = "feed" or
    this = "figure" or
    this = "form" or
    this = "grid" or
    this = "gridcell" or
    this = "group" or
    this = "heading" or
    this = "img" or
    this = "input" or
    this = "insertion" or
    this = "landmark" or
    this = "link" or
    this = "list" or
    this = "listbox" or
    this = "listitem" or
    this = "log" or
    this = "main" or
    this = "marquee" or
    this = "math" or
    this = "menu" or
    this = "menubar" or
    this = "menuitem" or
    this = "menuitemcheckbox" or
    this = "menuitemradio" or
    this = "meter" or
    this = "mark" or
    this = "navigation" or
    this = "none" or
    this = "note" or
    this = "option" or
    this = "paragraph" or
    this = "presentation" or
    this = "progressbar" or
    this = "radio" or
    this = "radiogroup" or
    this = "range" or
    this = "region" or
    this = "roletype" or
    this = "row" or
    this = "rowgroup" or
    this = "rowheader" or
    this = "scrollbar" or
    this = "search" or
    this = "searchbox" or
    this = "section" or
    this = "sectionhead" or
    this = "select" or
    this = "separator" or
    this = "slider" or
    this = "spinbutton" or
    this = "strong" or
    this = "structure" or
    this = "subscript" or
    this = "superscript" or
    this = "switch" or
    this = "suggestion" or
    this = "tab" or
    this = "table" or
    this = "tablist" or
    this = "tabpanel" or
    this = "term" or
    this = "text" or
    this = "textbox" or
    this = "time" or
    this = "timer" or
    this = "toolbar" or
    this = "tooltip" or
    this = "tree" or
    this = "treegrid" or
    this = "treeitem" or
    this = "widget" or
    this = "window"
  }

  boolean isDeprecatedRole() {
    // For now, no roles are deprecated. Add them with an if statement, as commented out below
    // if this = "deprecrated_role" then result = true else
    result = false
  }

  boolean isSupportedRole(DOM::AttributeDefinition role) {
    // FUTURE: Support cases there the attribute specifies multiple roles in a space-delimited collection

    if (
      // For debugging, replace "toLowerCase" with "toUpperCase" and all values will fail
      unquotedString(role.getValueNode().toString()).trim().toLowerCase() = this.toString()
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

// Analog of aria-allowed-role (debugged and working)
from DOM::ElementDefinition e
  where exists(e.getAttributeByName("role"))
  and not exists(any(DefinedRole role | role.isSupportedRole(e.getAttributeByName("role")) = true))
select e, unquotedString(e.getAttributeByName("role").getValueNode().toString())

// Analog of aria-required-attr (debugged and working)
// from DOM::ElementDefinition e
//   where exists(e.getAttributeByName("role"))
//   and exists(any(DefinedRole role | (
//     role.isSupportedRole(e.getAttributeByName("role")) = true
//     and exists(any(string requiredAttribute | (
//       requiredAttribute = role.getRequiredAttributes()
//       and
//       requiredAttribute != ""
//       and
//       not exists(e.getAttributeByName(requiredAttribute))
//     )))
//     )))
// select e, unquotedString(e.getAttributeByName("role").getValueNode().toString())
