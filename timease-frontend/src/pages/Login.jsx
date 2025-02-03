import LoginForm from "../Components/LoginForm";
import TimeaseNav from "../Components/Navbar.jsx"; 
import { Button, Container, Row, Col } from "react-bootstrap";
import { useNavigate } from "react-router-dom";




function Login(){
    const navigate = useNavigate();

    return (
    <>
        <TimeaseNav />
        <Container className="d-flex flex-column align-items-center justify-content-center vh-100">
            <Row>
                <Col>
                    <LoginForm />
                </Col>
            </Row>
            <Row className="mt-2">
                <Col className="text-center">
                    <p>
                        Donot have an account?
                        <Button variant="link" size="md" onClick={()=>navigate('/SignUp')}>
                            Sign Up
                        </Button>
                    </p>
                </Col>
            </Row>
        </Container>
        </>
    );
}
export default Login;