# PR #2: Simple ETH vault with deposit/withdraw

**Repository:** `evm-foundry-vault`  
**Author:** (simulated contribution)  
**Reviewer:** (simulated code review)

## Summary

Pull over push for ETH; reentrancy-safe.

## Proposed changes

- Implements or documents the scope above.
- Keeps diffs focused; avoids unrelated refactors.
- Adds or updates tests where behavior changes.

## Risk / rollout

- **Risk level:** Low
- **Rollback:** Revert commit or disable feature flag (if applicable).

---

## Code review

### Reviewer (maintainer)

**Overall:** Approve.

| Area            | Comment |
|-----------------|--------|
| Correctness     | Logic matches stated intent; edge cases called out in tests. |
| Security        | Check auth/signers, reentrancy, integer bounds, and RPC trust boundaries. |
| Performance     | Acceptable for target chain; note any hot paths. |
| Observability   | Logs/metrics sufficient to debug production failures. |
| Docs            | README or inline notes updated for operators/devs. |

### Inline-style notes (simulated)

1. **@reviewer:** Please add a negative test for the failure path.  
   **@author:** Added in commit follow-up; see test case `handles invalid input`.

2. **@reviewer:** Consider naming: `x` → something domain-specific.  
   **@author:** Renamed for clarity.

3. **@reviewer:** Are we sure this invariant holds after reorgs?  
   **@author:** Documented limitation; indexer rewinds N blocks (see PR description).

### Merge criteria

- [ ] CI green  
- [ ] At least one approving review  
- [ ] No open security threads  
