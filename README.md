# Code Dojo 🥋

An AI-powered training system that helps you achieve *real* programming mastery—not just passing tests, but building genuine fluency through adaptive, personalized practice.

## Why This Exists

AI coding assistants are amazing, but there's a real concern: if the AI writes all your code, do you actually learn anything? More importantly, are your skills going to quietly rot away? Our mental fitness is no longer an implicit side effect of our work, we must be *intentional* about training our minds the same way we go to the gym to maintain our physical fitness.

Code Dojo flips the script. Instead of AI writing code *for* you, it trains you to write better code *yourself*. Think of it as a personal sensei that:

- Generates fresh, unpredictable challenges tailored to your level
- Watches *how* you solve problems, not just whether you get the right answer
- Notices patterns in your thinking—missed opportunities, recurring struggles, breakthroughs
- Adapts future training based on what you actually need
- Tracks your progress with a martial arts belt system

The goal isn't to pass lessons. It's to write good code without thinking about it.

## Prerequisites

- [Claude Code](https://claude.ai/code) installed and working
- A terminal
- Willingness to struggle productively

## Getting Started

**One command to install:**

```bash
curl -fsSL https://raw.githubusercontent.com/cause-of-a-kind/code-dojo-core/main/install.sh | bash
```

This creates a `code-dojo` directory with everything you need, initialized as its own git repo so you can track your progress.

**Options:**

```bash
# Install to a custom directory
curl -fsSL https://raw.githubusercontent.com/cause-of-a-kind/code-dojo-core/main/install.sh | bash -s -- --dir my-training

# Skip git initialization  
curl -fsSL https://raw.githubusercontent.com/cause-of-a-kind/code-dojo-core/main/install.sh | bash -s -- --no-git
```

**Then start training:**

```bash
cd code-dojo
claude
```

Just tell Claude what you want to learn:

```
I want to learn Ruby
```

Claude will set up your skill track and run an initial assessment to gauge where you're starting. No need to self-assess—it'll figure out your level by watching you code.

**Alternative: Clone and set up manually**

If you prefer not to pipe to bash:

```bash
git clone https://github.com/cause-of-a-kind/code-dojo-core.git my-dojo
cd my-dojo
rm -rf .git                    # Remove the upstream repo
git init                       # Start fresh for your own progress
git add . && git commit -m "Initialize dojo"
```

## Commands

Once you're set up, training is simple:

| Command | What it does |
|---------|--------------|
| `train` | Start a training session. Claude picks what you need to work on. |
| `train <skill>` | Train a specific skill (e.g., `train sql`) |
| `progress` | See your current status across all skills |
| `assess` | Request a belt assessment (when you're ready) |
| `dashboard` | Open a visual progress dashboard in your browser |
| `review <session>` | Review a past session's problem and feedback |

A typical daily practice:

```
> train

[Claude generates a fresh problem based on your current state]
[You solve it in workspace/current/]
[You say "done" or "submit"]
[Claude reviews your solution, answers questions, updates your progress]
```

## The Belt System

Belts represent sustained mastery, not passed tests.

| Belt | Level |
|------|-------|
| ⬜ White | Beginner—learning syntax and basic constructs |
| 🟨 Yellow | Fundamentals solid—can write simple programs |
| 🟧 Orange | Comfortable with core concepts—starting to see patterns |
| 🟩 Green | Intermediate—good grasp of language idioms |
| 🟦 Blue | Proficient—writes clean, idiomatic code naturally |
| 🟪 Purple | Advanced—understands deeper concepts and edge cases |
| 🟫 Brown | Expert—can architect solutions and teach concepts |
| ⬛ Black | Master—deep fluency with ongoing katas to maintain edge |

You don't advance by passing a test. You advance by demonstrating consistent mastery across varied contexts over time. The system tells you when you're ready.

## Inline Questions

Stuck on something while coding? Don't stop to ask—just mark it in your code:

```ruby
# QUESTION: Is there a more idiomatic way to do this?
result = []
items.each { |i| result << i.upcase }
```

```sql
-- QUESTION: Should I use a CTE here instead?
SELECT * FROM orders WHERE customer_id IN (
  SELECT id FROM customers WHERE region = 'west'
)
```

When you submit, Claude answers all your questions in context. This keeps you in flow and your questions become valuable signal about where you need reinforcement.

## What Gets Tracked

Everything lives in simple YAML files you can inspect anytime:

- **Concept mastery**: Not just pass/fail, but how consistently you apply concepts across different contexts
- **Observations**: Patterns Claude notices—missed opportunities, anti-patterns, breakthroughs
- **Questions**: What you're uncertain about (this reveals a lot)
- **Session history**: Every problem, solution, and piece of feedback

Your progress is yours. It's just files in a repo. Back it up, version it, own it.

## Adding New Skills

Want to learn something new? Just say so:

```
I want to learn SQL
```

Claude creates a new skill track, generates domain-specific training context, and runs an assessment. You can have multiple active skills and train them on different days.

## Philosophy

- **Mastery takes time.** There are no shortcuts. The belt system enforces this.
- **Mastery takes maintenance.** Even black belts train forever, mastery is a lifelong pursuit that must be maintained.
- **How you solve matters.** Correct code that misses idiomatic patterns still needs work.
- **Variety builds fluency.** Seeing a concept in one context isn't enough. You need to apply it across many.
- **Questions are good.** They show you're thinking. Never hesitate to ask.
- **Struggle is productive.** If it's always easy, you're not growing.

## Your Data

Everything is local. Your progress, your solutions, your history—all in this repo. Nothing is sent anywhere except your conversations with Claude (which follow Anthropic's standard privacy practices).

Commit your progress to keep a history. Or don't. It's your dojo.

---

Now stop reading and go train.

```
claude
> train
```
