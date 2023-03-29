# this file contains collections of proxes we learned in the class
import numpy as np
from scipy.optimize import bisect

# =============================================================================
# TODO Complete the following prox for simplex
# =============================================================================

# Prox of capped simplex
# -----------------------------------------------------------------------------


def prox_csimplex(z, k):
    """
    Prox of capped simplex
            argmin_x 1/2||x - z||^2 s.t. x in k-capped-simplex.

    input
    -----
    z : arraylike
            reference point
    k : int
            positive number between 0 and z.size, denote simplex cap

    output
    ------
    x : arraylike
            projection of z onto the k-capped simplex
    """
    # safe guard for k
    assert 0 <= k <= z.size, 'k: k must be between 0 and dimension of the input.'

    # TODO do the computation here
    # Hint: 1. construct the scalar dual object and use `bisect` to solve it.

    def f_dual(lam):
        return np.dot(np.ones(z.size),np.clip(z-lam*np.ones(z.size),0,1)) - k
#     f_dual = lambda lam: np.ones(n)@np.clip(z-lam*np.ones(n),0,1).T - k
    root = bisect(f_dual,-10,10)
    # 2. obtain primal variable from optimal dual solution and return it.
    #
    x = np.clip(z-root*np.ones(z.size),0,1)
    return x


def prox_l1(x, t):
    """
    regular l1 prox included for convenience
    Note that you'll have to rescale the t input with the regularization parameter
    """
    y = np.zeros(x.size)
    ind = np.where(np.abs(x) > t)
    x_o = x[ind]
    y[ind] = np.sign(x_o)*(np.abs(x_o) - t)
    return y


def rank_project(Y, k):
    """	Prox of rank constrained matrices
            argmin_M 1/2||M - Y||^2 s.t. rank(M)<=k


    Parameters
    ----------
    Y : 2 dimensional array
    k : positive integer

    Returns
    -------
    2 dimensional array
            rank projected version of Y
    """
    # TODO write this function
    U_y, S_y , Vt_y = np.linalg.svd(Y,full_matrices=True)
    S_y[k:]=0
#     diagmat_S= S_y[0:k] * np.identity(len(S_y[0:k]))
    prox_matrix = (U_y*S_y)@Vt_y
    return prox_matrix


def nuclear_prox(Y, t):
    """Nuclear norm proximal operator
    argmin_M 1/(2t)||M - Y||^2 + ||M||_{*}

    Parameters
    ----------
    Y : 2 dimensional array
    k : positive integer

    Returns
    -------
    2 dimensional array
            proximal operator applied to Y
    """
    # TODO write this function
    U_y, S_y , Vt_y = np.linalg.svd(Y,full_matrices=True)
    S_y_hat = prox_l1(S_y,t)
#     diagmat_S= S_y_hat * np.identity(len(S_y_hat))
    prox_matrix = (U_y*S_y_hat)@Vt_y
    return prox_matrix
