# Group Assignments

This document tracks the assignment of counter blocks to student groups.

## Block Overview

The 4-bit counter is divided into the following blocks for group assignment:

| Block ID | Block Name | Description | Complexity |
|----------|------------|-------------|------------|
| B1 | DFF | D Flip-Flop with reset | Medium |
| B2 | AND2 | 2-input AND gate | Low |
| B3 | XOR2 | 2-input XOR gate | Low |
| B4 | Counter Stage | Single-bit counter stage | Medium |
| B5 | Top-Level Counter | 4-bit counter integration | High |

## Assignment Process

1. Groups will be formed during the first week of class
2. Each group will receive a GitHub Issue with their block assignment
3. Groups can request specific blocks, subject to availability
4. Advanced students may work on multiple blocks or more complex blocks

## Current Assignments

### Group 1
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 2
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 3
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 4
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 5
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 6
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 7
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 8
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 9
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

### Group 10
- **Members**: TBD
- **Assigned Block(s)**: TBD
- **Issue**: #TBD
- **Status**: Not Started

## Assignment Guidelines

### For Students

1. Check the GitHub Issues for your group's assignment
2. Assignments will be created as Issues with:
   - Block description
   - Specifications
   - Deliverables
   - Deadline
3. Comment on your issue if you have questions
4. Update the issue with progress regularly

### For Instructors

To assign a block to a group:

1. Create a GitHub Issue with title: `[Group N] Block Assignment: <Block Name>`
2. Use the assignment template (see `.github/ISSUE_TEMPLATE/block_assignment.md`)
3. Assign to group members
4. Add appropriate labels: `assignment`, `group-N`, `block-<name>`
5. Update this file with the assignment details

## Block Dependencies

Some blocks depend on others being completed first:

```
Level 1: AND2, XOR2 (can be done in parallel)
    ↓
Level 2: DFF (depends on basic gates being available)
    ↓
Level 3: Counter Stage (depends on DFF, XOR2, AND2)
    ↓
Level 4: Top-Level Counter (depends on Counter Stage)
```

**Note**: Groups working on higher-level blocks may start using simulated models or examples of lower-level blocks before those blocks are finalized.

## Status Tracking

Block status will be tracked through:
- GitHub Issues (for individual blocks)
- GitHub Project Board (for overall project status)
- This document (for quick reference)

Status values:
- **Not Started**: Assignment made but no work begun
- **In Progress**: Active development
- **In Review**: Pull request submitted
- **Complete**: Merged to main branch

## Communication

- Use your group's issue for block-specific questions
- Use GitHub Discussions for general questions
- Tag @instructors for urgent issues
- Weekly status updates expected in issue comments

## Example Assignment Issue

For reference, here's what a block assignment issue looks like:

```markdown
Title: [Group 1] Block Assignment: D Flip-Flop (DFF)

## Assignment Details

**Group**: 1
**Block**: D Flip-Flop (DFF)
**Complexity**: Medium
**Estimated Time**: 2-3 weeks

## Description

Design, simulate, characterize, and layout a D Flip-Flop with reset for use in the 4-bit counter.

## Specifications

See [DESIGN_SPECIFICATIONS.md](docs/DESIGN_SPECIFICATIONS.md#1-d-flip-flop-dff)

## Deliverables

- [ ] Schematic (.sch and .sym)
- [ ] Testbench and simulation results
- [ ] CACE characterization
- [ ] Layout (DRC/LVS clean)
- [ ] Documentation (README.md)
- [ ] Pull Request

## Resources

- [STUDENT_WORKFLOW.md](docs/STUDENT_WORKFLOW.md)
- [examples/dff/](examples/dff/)

## Timeline

- Week 1-2: Schematic and simulation
- Week 3: Characterization
- Week 4: Layout
- Week 5: PR submission

## Questions?

Post questions as comments on this issue.
```

## Updates

This document will be updated as groups are formed and assignments are made.

Last Updated: 2026-02-10
