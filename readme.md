<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/ladunjexa/ATM-Program">
    <img src="https://cdn-icons-png.flaticon.com/512/3407/3407226.png" alt="Logo" width="120" height="120">
  </a>

<h3 align="center">ATM Program</h3>

  <p align="center">
    ATM Program is an assembly script that simulates an ATM.
    <br />
    <a href="https://github.com/ladunjexa/ATM-Program"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/ladunjexa/ATM-Program/issues">Report Bug</a>
    ·
    <a href="https://github.com/ladunjexa/ATM-Program/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li><a href="#guidelines">Guidelines</a></li>
    <li><a href="#initialization">Initialization</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
This project is an ATM Program which as it sounds, it simulates an ATM (Automatic Teller Machine) that I've built with Assembly (Low-level programming language) using EasyCPU development environment.

The user will be allowed to perform the existing operations at the ATM when he provides a binary-code corresponding to the credit-card number format.
At this stage, the existing operations at the ATM are:
1. Cash deposits
2. Cash withdrawals
3. Checking balance

Cash Withdrawals and deposits can be made in local currency, NIS, and in foreign currencies, USD and EUR.
There are three card types and each card type has different definitions, different fees, credit limit, etc, the types are: Young, Standard and Business.

At the beginning of the program, 6 credit-cards are initizlized with a certain balance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Assembly][assembly]][Assembly-url]
* [![EasyCPU][easycpu]][EasyCPU-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GUIDELINES EXAMPLES -->
## Guidelines

### Credit-Card format in binary-code: (CCF)
A credit-card number is represented by byte (8-bits) where the first 3 bits represent the card type and the remaining 5 bits represent the credit-card id code, according to the following definition:
```
  Young=001
  Standard=010
  Business=011
```

### Account Balance format in binary-code: (ABF)
The account balance is represented by byte (8-bits) next to CCF byte, using the simplified and accepted binary base definition. The 8 bits together represent the amount accumulated in the account, according to that the max amount is:
```
(11111111)₂ = (1 × 2⁷) + (1 × 2⁶) + (1 × 2⁵) + (1 × 2⁴) 
              + (1 × 2³) + (1 × 2²) + (1 × 2¹) + (1 × 2⁰) = (255)₁₀
```
### Operations
The operations is represented by byte (8-bits) where the first 3 bits represent the currency type and the remaining 5 bits represent the amount.

#### Cash withdrawal
At this stage, the user has to choose which currency he wants to withdraw, and the amount.
Note: The withdrawal is made under the account types settings such as withdrawal fee & limit.
```
  Young={ limit: 50, fee: 5 }
  Standard={ limit: 100, fee: 4 }
  Business={ limit: none, fee: 1 }
```

#### Cash deposits:
At this stage, the user has to choose which currency he wants to withdraw, and the amount.
Note: the deposits is made under the account types settings such as deposit fee.
Note#2: All types of cards are allowed to deposit any amount of money as they wish.
```
  Young,Standard,Business={ fee: 2 }
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Initialization
In the initialization process, the following program settings and credit-cards are loaded.

| CC binary-code | type | id-code | balance dec-val |
| ----------- | ----------- | ----------- | ----------- |
| 00110001 00101000 | Young | 10001 | 40 |
| 01010010 01011010 | Standard | 10010 | 90 |
| 01110011 01100100 | Business | 10011 | 100 |
| 00110100 01010000 | Young | 10100 | 80 |
| 01010101 10001100 | Standard | 10101 | 140 |
| 01110110 11111111 | Business | 10110 | 255 |

| binary-code | definition | dec-val |
| ----------- | ----------- | ----------- |
| 00110010 | Withdrawal limit (Y) | 50 |
| 01100100 | Withdrawal limit (S) | 100 |
| 11111111 | Withdrawal limit (B) | 255 |
| 00000010 | Deposit fee | 2 |
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/ladunjexa/ATM-Program.svg?style=for-the-badge
[contributors-url]: https://github.com/ladunjexa/ATM-Program/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ladunjexa/ATM-Program.svg?style=for-the-badge
[forks-url]: https://github.com/ladunjexa/ATM-Program/network/members
[stars-shield]: https://img.shields.io/github/stars/ladunjexa/ATM-Program.svg?style=for-the-badge
[stars-url]: https://github.com/ladunjexa/ATM-Program/stargazers
[issues-shield]: https://img.shields.io/github/issues/ladunjexa/ATM-Program.svg?style=for-the-badge
[issues-url]: https://github.com/ladunjexa/ATM-Program/issues
[license-shield]: https://img.shields.io/github/license/ladunjexa/ATM-Program.svg?style=for-the-badge
[license-url]: https://github.com/ladunjexa/ATM-Program/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/lironabutbul6
[product-screenshot]: images/screenshot.png
[Assembly]: https://img.shields.io/badge/Assembly-20232A?style=for-the-badge&logo=assembly&logoColor=61DAFB
[Assembly-url]: https://www.tutorialspoint.com/assembly_programming/assembly_introduction.htm
[EasyCPU]: https://img.shields.io/badge/EasyCPU-DD0031?style=for-the-badge&logo=easycpu&logoColor=white
[EasyCPU-url]: https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.622.4315&rep=rep1&type=pdf
