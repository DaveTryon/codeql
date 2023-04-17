/*
 * @name Aria Allowed Role
 * @description Fail if a DOMElement's defined role is not allowed or unsupported
 */

import javascript
import Standards

// Analog of aria-allowed-role (debugged and working)
from DOM::ElementDefinition e
  where exists(e.getAttributeByName("role"))
  and not exists(Standards::DefinedRole role | role.isSupportedRole(e.getAttributeByName("role")) = true)
select Standards::getElementAttributeValue(e, "role"), e
