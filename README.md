# BetListLegacyRefactor
![ci](https://github.com/spyrosskordos/BetListLegacyRefactor/actions/workflows/ci.yml/badge.svg)


BetList legacy project refactor with Swift UI, MVVM, Unit Tests.

## Assumptions

1. **Bet calculations** in the original project are considered correct and require no changes.
2. **Bet name values** provided are not unique identifiers and are assumed to be non-exhaustive.
3. Bets with **negative sell-in values** can be displayed as per the original project specifications.

---

## Steps to Add a New Bet Type

To add a new bet type, follow these steps:

1. **Define a Struct/Class:**
   - Create a struct or class that conforms to the `BetUpdater` protocol.
   
2. **Implement Bet Update Logic:**
   - Define the specific update strategy for the new bet type in your struct/class.

3. **Register in the Registry:**
   - Register the struct or class in the `BetUpdatersRegistryImpl` to ensure it integrates seamlessly with the betrepository.

---

## Project Features
- **SwiftUI** 
- **MVVM Design Pattern** 
- **Coordinator Pattern** 
- **Factory Pattern** 
- **Unit Testing:** Achieves **100% test coverage** for the core business logic of bets, ensuring correctness and reliability.Testing framework is used.
- **Continuous Integration (CI):** Implement a simple CI infrastructure using GitHub Actions to automate builds, tests. (Let me know if you want access on the repo)



