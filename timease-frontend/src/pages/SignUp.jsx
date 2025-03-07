import TimeaseNav from "../Components/Navbar.jsx"; 
import SignUpForm from "../Components/SignUpForm";
import { Button, Container, Row, Col } from "react-bootstrap";
import { useNavigate } from "react-router-dom";


function SignUp(){
    const navigate = useNavigate();

    return(
    <>
        <TimeaseNav />

        <Container className="d-flex flex-column align-items-center justify-content-center vh-100">
            <Row>
                <Col>
                    <SignUpForm />
                </Col>
            </Row>
            <Row className="mt-2">
                <Col className="text-center">
                    <p>
                        already have an account?
                        <Button variant="link" size="md" onClick={()=>navigate('/Login')}>
                            Login
                        </Button>
                    </p>
                </Col>
            </Row>
        </Container>
    </>
    );
}

export default SignUp;