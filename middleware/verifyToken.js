import jwt from "jsonwebtoken";
import AppError from "../utils/AppError.js";

export const verifyToken = (req, res, next) => {
  const authHeaders = req.headers.token;

  if (authHeaders) {
    const token = authHeaders.split(" ")[1];
    jwt.verify(token, process.env.JWT_SECRET, (error, userInfo) => {
      if (error) {
        throw new AppError(401, "Token Not Valid", 401);
      }

      req.user = userInfo;

      next();
    });
  } else {
    throw new AppError(401, "You are not authorized", 401);
  }
};

export const verifyAuth = (req, res, next) => {
  verifyToken(req, res, () => {

    if (req.params.id == req.user.id || req.user.isadmin) {
      console.log(req.params.id);
      console.log(req.user.id);

      next();
    } else {
      throw new AppError(401, "You are not authorized", 401);
    }
  });
};
export const verifyAdmin = (req, res, next) => {
  verifyToken(req, res, () => {
    if (req.user.isAdmin) {
      next();
    } else {
      throw new AppError(401, "You are not admin", 401);
    }
  });
};
