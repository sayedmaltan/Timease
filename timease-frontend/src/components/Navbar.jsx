import { Container, Nav, Navbar } from "react-bootstrap";
import GetStartedButton from "./GetStartedButton.jsx";
import { useNavigate } from "react-router-dom";


function TimeaseNav() {
  const navigate = useNavigate();
  return (
    <Navbar bg="dark" data-bs-theme="dark">
      <Container>
        
        <Navbar.Brand className="btn cursor-pointer" onClick={()=>navigate('/')}>Timease</Navbar.Brand>

        
        <Nav className="me-auto">
          <Nav.Link href="#about">About Us</Nav.Link>
        </Nav>

        
        <GetStartedButton l="sm" />
      </Container>
    </Navbar>
  );
}

export default TimeaseNav;
