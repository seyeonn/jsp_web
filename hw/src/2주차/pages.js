//위와 같이 학생수와 페이지 크기가 각각 주어졌을 때, 페이지 수를 계산해서 출력하는 코드를 구현하시오.

let studentCount = 31;
let pageSize = 10;

console.log(Math.ceil(studentCount/pageSize));