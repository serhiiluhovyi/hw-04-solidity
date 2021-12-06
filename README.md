# HW-04

## Local running and deployment to rinkeby
### Before run:
- Copy '.env.example' to '.env'
- Populate it with appropriate values

### How to run:
```shell
npm install
npm run migrate-rinkeby
npm run verify-rinkeby
```

```shell
npx hardhat test
npx hardhat test ./test/HW04Exchange.test.ts     

npx hardhat coverage

```
