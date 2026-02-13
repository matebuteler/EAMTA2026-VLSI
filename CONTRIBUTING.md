# Contributing to EAMTA2026-VLSI

Thank you for contributing to the VLSI course project! This guide will help you contribute effectively.

## For Students

### Your Block Contribution

Each group is responsible for one or more blocks. Follow these steps:

1. **Check your assignment** in [docs/GROUP_ASSIGNMENTS.md](docs/GROUP_ASSIGNMENTS.md)
2. **Follow the workflow** in [docs/STUDENT_WORKFLOW.md](docs/STUDENT_WORKFLOW.md)
3. **Meet specifications** in [docs/DESIGN_SPECIFICATIONS.md](docs/DESIGN_SPECIFICATIONS.md)
4. **Submit via PR** using the block submission template

### Branch Naming

Use this format for your branch name:
```
group-<N>/<block-name>
```

Examples:
- `group-1/dff-design`
- `group-2/xor-gate`
- `group-3/counter-stage`

### Commit Messages

Write clear commit messages:
- **Good**: "Add DFF schematic with reset functionality"
- **Good**: "Fix timing violation in counter stage"
- **Bad**: "Update files"
- **Bad**: "wip"

### Pull Requests

When your block is complete:

1. Ensure all verification passes
2. Update your block README.md
3. Create a PR using the block submission template
4. Fill in all checklist items
5. Add screenshots of schematic, waveforms, layout
6. Request review from instructors

### Code Review

Address review comments promptly:
- Ask questions if something is unclear
- Make requested changes
- Update the PR
- Re-request review when ready

## Documentation Contributions

Found a typo or unclear instruction?

1. Create an issue or
2. Submit a PR with the fix

Keep documentation:
- Clear and concise
- Accurate
- Well-formatted (proper markdown)
- Helpful for future students

## Script Contributions

Created a useful script?

1. Test it thoroughly
2. Add clear documentation
3. Make it general-purpose (not hardcoded for your block)
4. Submit a PR to `scripts/`

## Example Contributions

Have a good reference implementation?

1. Ensure it's complete and well-documented
2. Don't include proprietary information
3. Submit to `examples/`

## Issue Reporting

### Bug Reports

Use the bug report template. Include:
- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Error messages
- Environment details

### Questions

Use the question template. Include:
- What you're trying to do
- What you've already tried
- Relevant documentation you've read

### Feature Requests

For new features or improvements:
- Describe the feature
- Explain why it's useful
- Suggest implementation if you have ideas

## Best Practices

### Git

- **Commit often**: Small, logical commits
- **Pull before push**: Always get latest changes
- **Don't commit binaries**: Check .gitignore
- **Meaningful messages**: Describe what and why

### Collaboration

- **Communicate**: Use issues and comments
- **Be respectful**: Everyone is learning
- **Help others**: Share knowledge and findings
- **Ask questions**: No question is too simple

### Quality

- **Test thoroughly**: Don't submit untested work
- **Document well**: Others need to understand your work
- **Follow specs**: Meet all requirements
- **Clean code**: Organized and readable

## Review Process

### For Students

1. Submit PR when your block is complete
2. Instructors will review (usually within 1 week)
3. Address comments and resubmit
4. Once approved, PR will be merged

### For Instructors

When reviewing PRs:
- Check all deliverables are present
- Verify simulations pass
- Review documentation completeness
- Check code/design quality
- Provide constructive feedback

## Integration

After blocks are merged:
- Integration team combines blocks
- System-level verification performed
- Issues reported back to groups if found

## Recognition

Contributors will be:
- Listed in commit history
- Recognized in course materials (with permission)
- Part of the open-source VLSI community!

## Questions?

- Check [docs/INDEX.md](docs/INDEX.md) for documentation
- Create an issue with the question template
- Use GitHub Discussions for general questions
- Contact course instructors

## Code of Conduct

### Expected Behavior

- Be respectful and professional
- Give and accept constructive feedback
- Focus on learning and collaboration
- Help create a positive environment

### Unacceptable Behavior

- Harassment or discrimination
- Plagiarism or copying without attribution
- Submitting others' work as your own
- Disruptive or unprofessional conduct

Violations will be handled per course policies.

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

## Getting Help

Stuck? Need help?

1. **Read docs**: Check [docs/INDEX.md](docs/INDEX.md)
2. **Ask group**: Collaborate with teammates
3. **Create issue**: Use question template
4. **Discussion forum**: General questions
5. **Instructor**: For urgent issues

## Thank You!

Your contributions help make this course better for everyone. Good luck with your designs!
