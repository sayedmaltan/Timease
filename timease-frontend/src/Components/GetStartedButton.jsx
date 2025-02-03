import { Button } from "react-bootstrap";
import { useNavigate } from "react-router-dom";

// eslint-disable-next-line react/prop-types
function GetStartedButton({l}) {
  const navigate = useNavigate();
  return (
    <Button variant="primary" size={l} onClick={()=>navigate('/SignUp')}>
      get Started
    </Button>
  );
}

export default GetStartedButton;
