import { Container, Row, Col } from "react-bootstrap";
import TimeaseNav from "../Components/Navbar.jsx"; 
import welcomeImage from "../assets/welcome.jpg"; 
import GetStartedButton from "../Components/GetStartedButton.jsx";


function Home() {
  return (
    <>
      <TimeaseNav />
      <Container className="d-flex align-items-center justify-content-center vh-100">
        <Row className="w-100">
          
          <Col md={6} className="d-flex flex-column justify-content-center">
            <h1 className="fw-bold">Welcome to Timease</h1>
            <p className="lead">
              Timease simplifies appointment scheduling, making it easy for 
              professionals and businesses to manage their time efficiently.
              Get started today and never miss an appointment again!
            </p>
            <GetStartedButton l="lg"/>
          </Col>

         
          <Col md={6} className="d-flex justify-content-center">
            <img src={welcomeImage} alt="Timease Scheduling" className="img-fluid" />
          </Col>
          
        </Row>
        
      </Container>
    </>
  );
}

export default Home;
