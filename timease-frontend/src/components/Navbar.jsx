import React from "react";
import { Container, Nav, Navbar } from "react-bootstrap";
import GetStartedButton from "./GetStartedButton.jsx";

function TimeaseNav() {
  return (
    <Navbar bg="dark" data-bs-theme="dark">
      <Container>
        {/* Brand Name on the Left */}
        <Navbar.Brand href="#home">Timease</Navbar.Brand>

        {/* Navigation Links in the Center */}
        <Nav className="me-auto">
          <Nav.Link href="#about">About Us</Nav.Link>
        </Nav>

        {/* Get Started Button on the Right */}
        <GetStartedButton text="Get Started" size="sm" />
      </Container>
    </Navbar>
  );
}

export default TimeaseNav;
