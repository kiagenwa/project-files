function checkCashRegister(price, cash, cid) {
    let changeAvailable = cid.map(item => [item[0], item[1]]);
    let changeDue = cash - price;
    let change = {
      "status": "INSUFFICIENT_FUNDS",
      "change": []
    };
    let temp = 0;
    for (let i in changeAvailable) {
      switch(changeAvailable[i][0]) {
        case "PENNY":
          changeAvailable[i].push(0.01);
          break;
        case "NICKEL":
          changeAvailable[i].push(0.05);
          break;
        case "DIME":
          changeAvailable[i].push(0.1);
          break;
        case "QUARTER":
          changeAvailable[i].push(0.25);
          break;
        case "ONE":
          changeAvailable[i].push(1);
          break;
        case "FIVE":
          changeAvailable[i].push(5);
          break;
        case "TEN":
          changeAvailable[i].push(10);
          break;
        case "TWENTY":
          changeAvailable[i].push(20);
          break;
        case "ONE HUNDRED":
          changeAvailable[i].push(100);
          break;
      };
      changeAvailable[i].push(Math.round(changeAvailable[i][1]/changeAvailable[i][2]));
    }
    changeAvailable.sort((a,b) => b[2]-a[2]);
    for (let i in changeAvailable) {
      if (changeDue % changeAvailable[i][2] != changeDue && changeAvailable[i][3] != 0) {
        temp = Math.floor(changeDue / changeAvailable[i][2]);
        if (temp > changeAvailable[i][3]) {
          temp = changeAvailable[i][1];
          changeAvailable[i][3] = 0;
          changeAvailable[i][1] = 0;
        } else {
          temp *= changeAvailable[i][2];
          changeAvailable[i][1] -= temp;
        }
        change.change.push([changeAvailable[i][0], temp]);
        changeDue -= temp;
        temp = 0;
        changeDue = Math.round(changeDue / 0.01) * 0.01;
        console.log(changeDue);   //debug error
      }
    }
    temp = changeAvailable.reduce((total, item) => total + item[1], 0);
    if (temp > 0 && changeDue == 0) {
      change.status = "OPEN";
    } else if (temp == 0 && changeDue == 0) {
      change.status = "CLOSED"
      change.change = cid;
    } else {
      change.change = [];
    }
    console.log(temp, change, changeDue); //debug variable stat
    return change;
  }
  
  checkCashRegister(3.26, 100, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);