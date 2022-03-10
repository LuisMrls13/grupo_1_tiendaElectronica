const loginController = {
    login:(req,res)=>{
        res.render("login",{req});
    }
};

module.exports = loginController;