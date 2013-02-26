<?php

class HTTP_Exception_401 extends Kohana_HTTP_Exception_401 {
 
    /**
     * Generate a Response for the 401 Exception.
     * 
     * The user should be redirect to a login page.
     * 
     * @return Response
     */
    public function get_response()
    {
        $response = Response::factory()
            ->status(401)
            ->headers('Location', URL::site('session/login'));
 
        return $response;
    }
}
?>
